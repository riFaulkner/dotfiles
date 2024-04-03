return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},




		opts = {
			formatters_by_ft = {
				go = { "gofmt", "goimports" },
				tf = { "terraform_fmt" },
				yaml = { "yamlfmt" },
				lua = { "stylua" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
		config = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			require("conform").setup()
			print("Setting up conform")
		end,

		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
