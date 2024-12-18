return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "sopa0/telescope-makefile",
    "akinsho/toggleterm.nvim",
    "ThePrimeagen/harpoon",
    -- "tpope/vim-fugitive"
  },
  requires = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'sopa0/telescope-makefile',
    "ThePrimeagen/harpoon",
    -- "tpope/vim-fugitive"
  },

  config = function()

    require('telescope').setup {
      prompt_prefix = ' ',
      path_display = { 'smart' },

      -- project = {
      --     hidden_files = true, -- default: false
      --     theme = 'dropdown',
      --     order_by = 'asc',
      --     search_by = 'title',
      --     sync_with_nvim_tree = true, -- default false
      --   },
    }
    pcall(require'telescope'.load_extension('projects'))
    pcall(require'telescope'.load_extension('harpoon'))
    -- pcall(require('telescope').load_extension('vim-fugitive'))
    pcall(require'telescope'.load_extension('make'))
  end,
}
