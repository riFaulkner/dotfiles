local g = vim.g
g["test#strategy"] = "neovim_sticky"
g["test#python#runner"] = "pytest"
g["test#ruby#runner"] = "rspec"

-- Bindings to make testing easier
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { silent = true, desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { silent = true, desc = "Run all tests in file" })
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { silent = true, desc = "Run all tests in suite" })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { silent = true, desc = "Run last test" })
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { silent = true, desc = "Visit test file" })

-- Close terminal with <C-o>
vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true })
