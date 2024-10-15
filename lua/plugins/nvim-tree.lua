return {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  cmd = 'NvimTreeToggle',  -- load on command
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 30,  -- width of the tree window
        side = 'right',  -- position of the tree ('left' or 'right')
      },
      renderer = {
        highlight_git = true,  -- highlight git changes
        icons = {
          glyphs = {
            default = '',
            symlink = '',
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              deleted = '',
              untracked = '★',
            },
          },
        },
      },
      filters = {
        dotfiles = false,  -- show dotfiles
      },
    }
  end
}

