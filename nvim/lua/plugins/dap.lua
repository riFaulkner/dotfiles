return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio", -- required for nvim-dap-ui
		"rcarriga/nvim-dap-ui",
		'theHamsta/nvim-dap-virtual-text',
		"suketa/nvim-dap-ruby",
		'leoluz/nvim-dap-go'

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
		vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = "DAP Continue" })
		vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = "DAP Step Over" })
		vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = "DAP Step Into" })
		vim.keymap.set('n', '<leader>du', function() dap.step_out() end, { desc = "DAP Step Out" })
		vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
		vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint() end, { desc = "DAP Set Breakpoint" })
		vim.keymap.set('n', '<leader>dml',
			function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
			{ desc = "DAP Set Log Point" })
		vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end, { desc = "DAP Open REPL" })
		vim.keymap.set('n', '<leader>dl', function() dap.run_last() end) -- todo: will this have a conflict with leader dlp?
		vim.keymap.set({ 'n', 'v' }, '<leader>dh', function()
			require('dap.ui.widgets').hover()
		end, { desc = "DAP Hover Variables" })
		vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
			require('dap.ui.widgets').preview()
		end, { desc = "DAP Preview Variables" })
		vim.keymap.set('n', '<leader>df', function()
			local widgets = require('dap.ui.widgets')
			widgets.centered_float(widgets.frames)
		end, { desc = "DAP Frames" })
		vim.keymap.set('n', '<leader>ds', function()
			local widgets = require('dap.ui.widgets')
			widgets.centered_float(widgets.scopes)
		end, { desc = "DAP Scopes" })

		-- Debuggers
		require("dap-go").setup()
		require("dap-ruby").setup()
		-- Scala
	end,
	-- require("nvim-dap-virtual-text").setup()
	-- require("nvim-dap-ui").setup()
}
