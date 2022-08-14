return require("packer").startup(function(use)
    -- plugins start here:
    use("wbthomason/packer.nvim")  -- Packer manager
    -- use("nvim-lua/popup.nvim")  -- Popup API
    use("nvim-lua/plenary.nvim")  -- Useful lua functions for telescope
    use("tpope/vim-commentary")  -- useful gc comment block of code
    -- use("antoinemadec/FixCursorHold.nvim") -- fix lsp trigger

    -- CMP plugins:
    use("hrsh7th/nvim-cmp") -- the completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completion
    use("hrsh7th/cmp-path") -- path completion
    use("hrsh7th/cmp-cmdline") -- commandline completion
    use("saadparwaiz1/cmp_luasnip") -- snippet completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("nvim-lua/lsp_extensions.nvim")
    use("windwp/nvim-autopairs") -- Auopairs, integrated with cmp

    -- Snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- default snippets

    -- LSP
    use("neovim/nvim-lspconfig")  -- enable LSP
    use("williamboman/nvim-lsp-installer")  -- simple to use lsp installer
    use("RRethy/vim-illuminate")  -- highlight same words
    use("onsails/lspkind-nvim")
    use("nanotee/sqls.nvim")
    -- use({
  -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  -- config = function()
    -- require("lsp_lines").setup()
  -- end,
-- })
--use("lewis6991/hover.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("BurntSushi/ripgrep")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Colorscheme section
    use("folke/tokyonight.nvim")

    -- Git
    -- use("lewis6991/gitsigns.nvim")
    use("TimUntersberger/neogit")

    -- Undotree
    use("mbbill/undotree")
    --use("glepnir/lspsaga.nvim")
    -- use("simrat39/symbols-outline.nvim")

    -- if PACKER_BOOTSTRAP then
    --     require("packer").sync()
    -- end
end)
