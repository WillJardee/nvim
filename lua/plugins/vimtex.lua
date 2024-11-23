return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_complete_enabled = 1
    vim.g.vimtex_complete_close_braces = 1
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_bibliography_commands = {'bibliography', 'addbibresource'}
    vim.g.vimtex_delim_toggle_mod_list = {
      {'\\left', '\\right'},
      {'\\Big', '\\Big'},
      {'\\biggr', '\\biggr'}
    }
  end
}
