return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "scala", "sbt", "thrift" },
	opts = function()
		local metals_config = require("metals").bare_config()
		metals_config.on_attach = function(client, bufnr)
			On_attach(client, bufnr)

			vim.keymap.set("n", "<leader>cmd", function()
				require("telescope").extensions.metals.commands()
			end, { desc = "Metals Commands" })

			require("metals").setup_dap()
		end
		metals_config.settings = {
			autoImportBuild = "all",
			defaultBspToBuildTool = true,
			-- showImplicitArguments = true,
			-- showImplicitConversionsAndClasses = true,
			-- showInferredType = true,
			-- statusBarProvider = "off", -- don't think this is a real thing, see the below of adding statusBarProvider to init_options -- NVim metals you are the worst
		}
		metals_config.init_options.statusBarProvider = "off"

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end
}
