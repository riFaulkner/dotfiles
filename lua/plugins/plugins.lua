return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim",  opts = {} },

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
		end,
	},
	"github/copilot.vim",
	"vim-test/vim-test",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim",       opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	{
		-- TODO: Null-ls is apparently going to be deprecated. Look into a replacement
		-- Auto code formatter
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ -- TODO: Current theam, think about changing it to tokyonight
		"navarasu/onedark.nvim",
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		main = "ibl",
		opts = {
			-- char = "┊",
			-- show_trailing_blankline_indent = false,
		},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Items to consider.
	-- nerd-tree
	-- oil.nvim
	--
	-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
	--       These are some example plugins that I've included in the kickstart repository.
	--       Uncomment any of the lines below to enable them.
	-- require 'kickstart.plugins.autoformat',
	-- require 'kickstart.plugins.debug',
}
