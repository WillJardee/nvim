return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_delim_toggle_mod_list = {
      {'\\left', '\\right'},
      {'\\Big', '\\Big'},
      {'\\biggr', '\\biggr'}
    }
  end
}