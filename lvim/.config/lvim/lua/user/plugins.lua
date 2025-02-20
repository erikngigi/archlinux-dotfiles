lvim.plugins = {
	-- { "HiPhish/rainbow-delimiters.nvim" },
	{ "NvChad/nvim-colorizer.lua" },

	-- colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "Mofiqul/dracula.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{ "marko-cerovac/material.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"sontungexpt/witch",
		priority = 1000,
		lazy = false,
		config = function(_, opts)
			require("witch").setup(opts)
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			-- Set the background to hard for a black background
			vim.g.gruvbox_material_background = "hard" -- Use 'hard' for black background
			vim.g.gruvbox_material_transparent_background = 1
			-- Set the colorscheme
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{ "Abstract-IDE/Abstract-cs" },

	-- terraform
	{ "hashivim/vim-terraform" },

	-- PHPDocs
	{ "mralejandro/vim-phpdoc" },

	-- -- neotree
	-- {
	-- "nvim-neo-tree/neo-tree.nvim",
	-- branch = "v3.x",
	-- dependencies = {
	--   "nvim-lua/plenary.nvim",
	--   "nvim-tree/nvim-web-devicons",
	--   "MunifTanjim/nui.nvim",
	--   },
	-- },

	-- python environments
	{ "AckslD/swenv.nvim" },
	{ "stevearc/dressing.nvim" },

	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
	},
}

require("swenv").setup({
	post_set_venv = function()
		vim.cmd("LspRestart")
	end,
})
