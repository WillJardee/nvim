return {
  'bullets-vim/bullets.vim',
  ft = { "markdown",
         "text",
         "html",
         "org",
         "scratch",
         "tex"
       }, -- Load only for relevant filetypes
  config = function ()
    vim.g.bullets_renumber_on_change = 0
    -- vim.g.bullets_custom_mappings = {
    --   {'nmap', '<C-CR>', '<Plug>(bullets-newline)'},
    --   {'imap', '<C-CR>', '<Plug>(bullets-newline)'},
    -- }
    -- vim.g.bullets_set_mappings = 1
  end
}
