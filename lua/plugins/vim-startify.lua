return {
  'mhinz/vim-startify',
  config = function()
    -- Startify configuration here
    vim.g.startify_lists = {
      { type = 'files', header = {'   Recent Files'} },
      { type = 'sessions',  header = {'   Sessions'} },
      { type = 'dir', header = {'   Current Directory: '..vim.fn.getcwd()} },
      { type = 'bookmarks', header = {'   Bookmarks'} },
    }

    vim.g.startify_bookmarks = {
      {i = '~/.config/nvim/init.lua'},
      {p = '~/projects/'},
      {t = '~/todo.txt'},
    }

    -- Session Directory (optional)
    vim.g.startify_session_dir = '~/.config/nvim/sessions'
  end
}

