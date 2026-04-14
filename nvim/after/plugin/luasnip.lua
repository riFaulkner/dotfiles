local ls = require "luasnip"
-- local s = ls.snippet

ls.cleanup()
ls.add_snippets("all", {
  ls.parser.parse_snippet("expand", "-- expanding the text here"),
})

ls.add_snippets("lua", {
  ls.parser.parse_snippet("lf", "local ${1:name} = function(${2:args})\n $0\nend"),
})

ls.add_snippets("scala", {
  ls.parser.parse_snippet("tc",
    "class $TM_FILENAME$1 extends AnyFunSpec with Matchers with MockFactory {\n\n describe(\"$TM_FILENAME$0\")\n}"),
  ls.parser.parse_snippet("desc", "describe(\"$0\"){\n}"),
  ls.parser.parse_snippet("it", "it(\"$0\"){\n}"),
})

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    return ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd> source ~/.config/nvim/after/plugin/luasnip.lua<CR>",
  { desc = "Reload luasnip" })
