return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio", -- required for nvim-dap-ui
		"rcarriga/nvim-dap-ui",
		'theHamsta/nvim-dap-virtual-text',
		"suketa/nvim-dap-ruby"
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		-- dapui setup
		-- require("lazydev").setup({
		--   library = { "nvim-dap-ui" },
		-- })
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- keymaps
		vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
		vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
		vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
		vim.keymap.set('n', '<leader>du', function() dap.step_out() end)
		vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
		vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint() end)
		vim.keymap.set('n', '<leader>dlp',
			function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
		vim.keymap.set('n', '<leader>dl', function() dap.run_last() end) -- todo: will this have a conflict with leader dlp?
		vim.keymap.set({ 'n', 'v' }, '<leader>dh', function()
			require('dap.ui.widgets').hover()
		end)
		vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
			require('dap.ui.widgets').preview()
		end)
		vim.keymap.set('n', '<leader>df', function()
			local widgets = require('dap.ui.widgets')
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set('n', '<leader>ds', function()
			local widgets = require('dap.ui.widgets')
			widgets.centered_float(widgets.scopes)
		end)

		-- Debuggers
		-- Scala
		-- should be done by metals?
		-- Ruby
		require("dap-ruby").setup()
		-- dap.adapters.ruby = function(callback, config)
		-- 	callback {
		-- 		type = "server",
		-- 		host = "127.0.0.1",
		-- 		port = "${port}",
		-- 		executable = {
		-- 			command = "bundle",
		-- 			args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
		-- 				"-c", "--", "bundle", "exec", config.command, config.script,
		-- 			},
		-- 		},
		-- 	}
		-- end
		--
		-- dap.configurations.ruby = {
		-- 	{
		-- 		type = "ruby",
		-- 		name = "debug current file",
		-- 		request = "attach",
		-- 		localfs = true,
		-- 		command = "ruby",
		-- 		script = "${file}",
		-- 	},
		-- 	{
		-- 		type = "ruby",
		-- 		name = "run current spec file",
		-- 		request = "attach",
		-- 		localfs = true,
		-- 		command = "rspec",
		-- 		script = "${file}",
		-- 	},
		-- }
	end,
	-- require("nvim-dap-virtual-text").setup()
	-- require("nvim-dap-ui").setup()

	-- 	let dap = require("nvim-dap"())
	-- 	dap.adapters.ruby = function(callback, config)
	--   callback {
	--     type = "server",
	--     host = "127.0.0.1",
	--     port = "${port}",
	--     executable = {
	--       command = "bundle",
	--       args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
	--         "-c", "--", "bundle", "exec", config.command, config.script,
	--       },
	--     },
	--   }
	-- end
	--
	-- dap.configurations.ruby = {
	--   {
	--     type = "ruby",
	--     name = "debug current file",
	--     request = "attach",
	--     localfs = true,
	--     command = "ruby",
	--     script = "${file}",
	--   },
	--   {
	--     type = "ruby",
	--     name = "run current spec file",
	--     request = "attach",
	--     localfs = true,
	--     command = "rspec",
	--     script = "${file}",
	--   },
	-- },

}
