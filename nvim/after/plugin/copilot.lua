-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_assume_mapped = true

-- Set the copilot file types
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["dockerfile"] = true,
  ["go"] = true,
  ["graphql"] = true,
  ["java"] = true,
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["json"] = true,
  ["kotlin"] = true,
  ["lua"] = true,
  ["make"] = true,
  ["markdown"] = true,
  ["mdx"] = true,
  ["php"] = true,
  ["python"] = true,
  ["ruby"] = true,
  ["scala"] = true,
  ["sh"] = true,
  ["shell"] = true,
  ["sql"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["vim"] = true,
  ["vue"] = true,
  ["yaml"] = true,
}
