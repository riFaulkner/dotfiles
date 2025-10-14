return {
	-- Staying here
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Comment out lines with gc
	{ "numToStr/Comment.nvim", opts = {} },
	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim",  opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	"vim-test/vim-test",

	-- cosmetic stuff
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},

	-- might move
	"github/copilot.vim",

	-- still evaluating
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim",       opts = {} },

			"folke/neodev.nvim",
		},
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	'christoomey/vim-tmux-runner',

	-- {
	-- 	-- TODO: Null-ls is apparently going to be deprecated. Look into a replacement
	-- 	-- Auto code formatter
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },

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
