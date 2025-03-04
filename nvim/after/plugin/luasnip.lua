local ls = require "luasnip"
local s = ls.snippet

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",

  -- enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    return ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    return ls.jump(-1)()
  end
end, { silent = true })

vim.keymap.set("i", "<c-m>", function()
  if ls.choice_active() then
    return ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd> source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
