local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed OPSIE")
	return
end

return packer.startup(function(use)
	-- plugins start here:
	use("wbthomason/packer.nvim") -- Packer manager
	use("numToStr/Comment.nvim") -- useful gc comment block of code
	use("lukas-reineke/indent-blankline.nvim")
	--
	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	-- use("onsails/lspkind-nvim") -- vscode-like pictograms
	use({ "glepnir/lspsaga.nvim" }) -- add enhanced ui to lsp
	use("j-hui/fidget.nvim")

	-- LSP package manager
	use("williamboman/mason.nvim") -- lsp manager easy to install
	use("williamboman/mason-lspconfig.nvim") -- mason w.r.t. nvim-lspconfig
	use("jayp0521/mason-null-ls.nvim") -- w.r.t. null-ls

	-- CMP plugins:
	use("hrsh7th/nvim-cmp") -- the completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completion
	use("hrsh7th/cmp-path") -- path completion
	use("hrsh7th/cmp-cmdline") -- commandline completion
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- snippet completion
	use("nvim-lua/lsp_extensions.nvim")
	use("windwp/nvim-autopairs") -- Auopairs, integrated with cmp

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- default snippets

	-- database stuff
	use("tpope/vim-dadbod")
	use({ "kristijanhusak/vim-dadbod-completion", requires = "tpope/vim-dadbod" })
	-- use my own fork to fix the display-schemas issue for RDS.
	use({ "MattiasMTS/vim-dadbod-ui", requires = "tpope/vim-dadbod" })
	-- use("lifepillar/pgsql.vim")

	-- Terminal REPL stuff
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("nvim-lua/plenary.nvim") -- Useful lua functions for telescope
	use("kyazdani42/nvim-web-devicons") -- file icons
	use({ "nvim-tree/nvim-tree.lua" })

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})
	-- use("nvim-treesitter/nvim-treesitter-context")

	-- Statusline
	use("hoob3rt/lualine.nvim")

	-- Colorscheme section and styling.
	use("folke/tokyonight.nvim")
	use("folke/todo-comments.nvim")

	-- Git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Undotree
	use("mbbill/undotree")

	-- docstrings/annotations
	use({
		"danymat/neogen", -- docstring generator
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*",
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("epwalsh/obsidian.nvim")

	-- Formatting / linting
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Other stuff
	use("ThePrimeagen/vim-be-good")
	use("ThePrimeagen/harpoon")

	if packer_bootstrap then
		packer.sync()
	end
end)
