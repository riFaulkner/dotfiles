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
				-- ["*"] = { "codespell" },
				go = { "gofmt", "goimports" },
				lua = { "stylua" },
				python = { "isort", "black" },
				tf = { "terraform_fmt" },
				yaml = { "yamlfmt" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},

		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
