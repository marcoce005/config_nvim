-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'ojroques/nvim-hardline'}

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  -- Installa nvim-lspconfig
  use 'neovim/nvim-lspconfig'

  -- Installa pyright come LSP per Python
  use 'williamboman/mason.nvim'       -- Gestore di LSP
  use 'williamboman/mason-lspconfig.nvim' -- Helper per lspconfig
  use 'hrsh7th/nvim-cmp'              -- Autocompletamento
  use 'hrsh7th/cmp-nvim-lsp'          -- Fonte completamento da LSP
  use 'nvim-treesitter/nvim-treesitter' -- Sintassi avanzata (opzionale)

  -- Tab and terminal in nvim
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
  end}

  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

end)
