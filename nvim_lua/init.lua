--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

if (vim.g.vscode) then
  require('core/options')
  else

-- vim.cmd("colorscheme onedarkpro")
-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')

-- Enable toggle terminal


require("toggleterm").setup{
    open_mapping = [[<c-`>]],

}


-- Enable lualine
require('lualine').setup {
  options = {
   theme = 'onedarkpro'
    --  theme = 'edge'

    -- ... your lualine config
  }
}


end
