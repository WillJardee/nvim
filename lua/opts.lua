-- Basic settings
vim.o.number = true         -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.termguicolors = true  -- Enable true color support
vim.opt.clipboard = 'unnamedplus'

-- Use spaces instead of tabs
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2        -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 2       -- Number of spaces a <Tab> counts for while editing

vim.g.UltiSnipsExpandTrigger        = '<Tab>'
vim.g.UltiSnipsListSnippets         = '<C-Tab>'
vim.g.UltiSnipsJumpForwardTrigger   = '<C-j>'
vim.g.UltiSnipsJumpBackwardTrigger  = '<C-k>'
vim.g.UltiSnipsAuthor               = 'William Jardee'
