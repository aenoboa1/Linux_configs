-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- Outline
  --use 'simrat39/symbols-outline.nvim'

  use "lunarvim/synthwave84.nvim"

  -- VimTeX
  use 'lervag/vimtex'
  -- Refactor
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
      }
  }


  -- Sniplets
  -- Rainbow CSV


  use "mechatroner/rainbow_csv"

  -- Split windows
  use 'mrjones2014/smart-splits.nvim'


  -- Easy Motion Neovim
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- stupid bar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- markdown
  use {"ellisonleao/glow.nvim"}
  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  use 'puremourning/vimspector'

  use 'simrat39/rust-tools.nvim'

-- Debugging
use 'nvim-lua/plenary.nvim'
use 'mfussenegger/nvim-dap'



  -- Tag viewer
use({
    'ray-x/navigator.lua',
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
})

  -- Treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- Color schemes
  --use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }


  -- Vista
  use 'liuchengxu/vista.vim'


  -- React Snippets

  use 'SirVer/ultisnips'
  use 'mlaursen/vim-react-snippets'



  use 'navarasu/onedark.nvim'

  -- OneDark Alternative
  use{
    "olimorris/onedarkpro.nvim",

      as = "onedarkpro",
      config = function()

        require("core.colors").setup()

        -- transparency = true,}

      end
}


  use 'sainnhe/edge'

  -- LSP
 use 'neovim/nvim-lspconfig'

 -- symbols outline

-- use 'simrat39/symbols-outline.nvim'


  -- Autocomplete -- Disable
--  use {
--    'hrsh7th/nvim-cmp',
--    requires = {
--      'L3MON4D3/LuaSnip',
--      'hrsh7th/cmp-nvim-lsp',
--      'hrsh7th/cmp-path',
--      'hrsh7th/cmp-buffer',
--      'saadparwaiz1/cmp_luasnip',
--    },
--  }
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Python Debug
  use 'mfussenegger/nvim-dap-python'

  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

  --  Coc nvim
  use {'neoclide/coc.nvim', branch = 'release'}
  -- Statusline
 -- use {
 --   'feline-nvim/feline.nvim',
 --   requires = { 'kyazdani42/nvim-web-devicons' },
 -- }




use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

  -- Discord rich presence

  use 'andweeb/presence.nvim'



  -- Dashboard

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  -- MD Preview

  -- Rainbow shit
  use {
    'p00f/nvim-ts-rainbow'
  }
  -- multicursors
  --use{
  --  'terryma/vim-multiple-cursors'
  --}
  -- hex coloring
  use{
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup{}
    end

  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{
    'mg979/vim-visual-multi'
  }

  use {'iamcco/markdown-preview.nvim'}

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup{}
    end
  }
  -- Which key


  -- Navigator


  use 'simrat39/symbols-outline.nvim'


  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }

  -- Dashboard (start screen)
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
