require("faulkner")

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- Is this needed if the leader map is set in above it?

-- Setup Lazy for plugin management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- auto setup the items in /lua/plugins dir. Starting with plugins.lua which is currently the catch all for plugins that were originally in this file
require("lazy").setup("plugins")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Open floating [d]iagnostic message" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- print("LSP attached " .. client .. " to buffer " .. bufnr)
  print("LSP attached to buffer " .. bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-s>", vim.lsp.buf.signature_help, "Signature documentation")

  -- Lesser used LSP functionality
  nmap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

-- Creates a lil global wrapper for on attach methoed
On_attach = function(client, bufnr)
  on_attach(client, bufnr)
end

local group = vim.api.nvim_create_augroup('LspAttachGroup', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
    -- print(vim.inspect(args))
    local opts = { buffer = args.buf, client = args.data.client_id, silent = true } -- silent = true ??

    on_attach(opts.client, opts.buffer)
  end
})

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  gopls = {
    analyses = {
      unusedparams = true,
    },
    staticcheck = true,
  },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },

  pyright = {
    anyalize = {
      typeCheckingMode = "strict",
    },
  },

  bashls = {},
}

-- Setup neovim lua configuration
-- require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})


-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    -- tab bad apparently there are reasons in :help ins-completion
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  }
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
