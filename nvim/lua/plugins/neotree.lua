return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem  position=current<CR>",
			{ desc = "Open Neotree in netRW style" })
		-- :Neotree position=current
		-- vim.keymap.set("n", "<leader>b", ":Neotree toggle show buffers right<cr>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree toggle buffers reveal right <CR>", {})
	end,
}
