return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = { theme = 'auto' },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
          file_status = true,
          shorting_target = 40,
          symbols = {
            modified = '[+]',
            readonly = '[-]',
            unnamed = '[No Name]',
          }
        }
      }
    }
  }
}
