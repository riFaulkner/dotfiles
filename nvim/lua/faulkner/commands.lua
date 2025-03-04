vim.api.nvim_create_user_command("AutoRunTests", function()
  print("Running tests autocommand")
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("AutoRunTests", { clear = true }),
    callback = function()
      vim.cmd(":TestFile")
    end,
  })
end, { desc = "Run tests for current file" })
