local v = vim

local install_path = v.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if v.fn.empty(v.fn.glob(install_path)) > 0 then
	Packer_bootstrap = v.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

v.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-angular",
	})

	-- telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		branch = "v2.x",
	})

	-- nvim cmp
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })

	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })

	-- apps
	use({ "mhinz/vim-startify" })
	use({ "vimwiki/vimwiki" })

	-- utils
	use({ "editorconfig/editorconfig-vim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "justinmk/vim-sneak" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "folke/todo-comments.nvim" })
	use({ "lewis6991/impatient.nvim" })

	-- python
	use({ "rafi/vim-venom", ft = "python" })

	-- ui
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "romgrk/barbar.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "RRethy/nvim-treesitter-textsubjects" })
	use({ "rktjmp/lush.nvim" })

	-- theme
	use({ "rebelot/kanagawa.nvim" })

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
