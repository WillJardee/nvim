return {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  lazy = false,
  -- cmd = 'NvimTreeToggle',  -- load on command
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_cursor = true,
      respect_buf_cwd = true,
      -- sync_root_with_cwd = true, -- Sync nvim-tree with current working directory
      view = {
        width = 30,  -- width of the tree window
        side = 'right',  -- position of the tree ('left' or 'right')
      },
      update_focused_file = {
        enable = true, -- Highlight the current file in the tree
        -- update_cwd = true, -- Change cwd to the file's directory
      },
      renderer = {
        -- highlight_git = true,  -- highlight git changes
        highlight_opened_files = "name", -- Highlight the opened file
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
        custom = { '.git', 'node_modules', '.cache' }, -- Hide specific patterns
      },
      git = {
        enable = true, -- Show git status
        ignore = false, -- Show ignored files
      },
    }
  end
}

