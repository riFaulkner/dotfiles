-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_assume_mapped = true

-- Set the copilot filetypes
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["javascriptreact"] = true,
  ["json"] = true,
  ["yaml"] = true,
  ["markdown"] = true,
  ["mdx"] = true,
  ["vue"] = true,
  ["php"] = true,
  ["python"] = true,
  ["go"] = true,
  ["java"] = true,
  ["lua"] = true,
  ["kotlin"] = true,
  ["graphql"] = true,
  ["sql"] = true,
  ["shell"] = true,
  ["sh"] = true,
  ["dockerfile"] = true,
  ["vim"] = true,
  ["make"] = true,
}
