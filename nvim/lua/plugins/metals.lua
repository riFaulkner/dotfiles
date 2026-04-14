return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "mfussenegger/nvim-dap",
	},
	ft = { "scala", "sbt", "thrift" },
	opts = function()
		local metals_config = require("metals").bare_config()

		-- Set environment variables for sbt BSP server
		metals_config.cmd_env = {
			SBT_OPTS = "-Xms512m -Xmx4096m -Xss4M"
		}

		metals_config.on_attach = function(client, bufnr)
			On_attach(client, bufnr)

			vim.keymap.set("n", "<leader>cmd", function()
				require("telescope").extensions.metals.commands()
			end, { desc = "Metals Commands" })

			-- require("metals").setup_dap() // maybe one day
		end
		metals_config.settings = {
			autoImportBuild = "all",
			defaultBspToBuildTool = true,
			-- inlayHints = {
			-- 	byNameParameters = { enable = true },
			-- },
			-- JVM options for the sbt build server
			serverProperties = {
				"-Xms512m", -- Initial heap size
				"-Xmx4096m", -- Maximum heap size (4GB for large projects)
				"-Xss4M" -- Stack size
			}

			-- scalafmtConfigPath
			-- showInferredType = true,
		}
		metals_config.init_options.statusBarProvider = "off"

		-- Try this to see if it'll work to get values to propagate to my
		-- metals_config.cmd_env = {
		--      SBT_OPTS = "-Xms512m -Xmx4096m -Xss4M"
		--  }

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
