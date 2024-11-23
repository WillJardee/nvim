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
vim.g.ultisnips_python_style        = "numpy"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disables netrw to make room for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options are suggestion from ChatGPT
-- Editing and Cursor Behavior
vim.o.cursorline = true              -- Highlight the current line
vim.o.cursorcolumn = false           -- Highlight the current column (useful for editing tables or aligning)
vim.o.scrolloff = 8                  -- Keep 8 lines visible above/below the cursor while scrolling
vim.o.sidescrolloff = 8              -- Keep 8 columns visible to the left/right of the cursor
vim.o.wrap = false                   -- Disable line wrapping (recommended for code editing)
vim.o.incsearch = true               -- Incremental search as you type
vim.o.hlsearch = true                -- Highlight search results
vim.o.ignorecase = true              -- Ignore case in search patterns
vim.o.smartcase = true               -- Override ignorecase if search includes capital letters
vim.o.mouse = 'a'                    -- Enable mouse support in all modes
vim.o.backspace = 'indent,eol,start' -- Enable more intuitive backspacing behavior

-- Interface and UI
vim.o.showmode = false               -- Don't show mode in command line (useful if you have a statusline)
vim.o.showcmd = true                 -- Show incomplete commands in the bottom right corner
vim.o.laststatus = 3                 -- Use a global status line across splits (Neovim 0.7+)
vim.o.signcolumn = 'yes'             -- Always show the sign column to avoid text shifting
vim.o.cmdheight = 1                  -- Height of command line
vim.o.updatetime = 300               -- Faster completion (in ms) and updates the swap file faster
vim.o.pumheight = 10                 -- Limit pop-up menu height
vim.o.completeopt = 'menuone,noselect' -- Better completion experience (for nvim-cmp or other completion plugins)

-- Indentation and Formatting
vim.o.autoindent = true              -- Copy indent from current line when starting a new line
vim.o.smartindent = true             -- Smart indentation for C-like languages
vim.o.formatoptions = 'jcroqlnt'     -- Format settings, useful for prose editing and keeping code clean

-- Performance and Backup
vim.o.lazyredraw = true              -- Redraw only when necessary (improves performance)
vim.o.synmaxcol = 240                -- Limit syntax highlighting to 240 columns (improves performance in large files)
vim.o.backup = false                 -- Disable backup files
vim.o.writebackup = false            -- Disable backup before overwriting a file
vim.o.swapfile = false               -- Disable swap files for better performance
vim.o.undofile = true                -- Enable persistent undo
vim.o.undodir = vim.fn.stdpath('config') .. '/undo' -- Set directory for undo files

-- Autocompletion
-- vim.opt.wildmenu = true              -- Visual autocomplete for command menu
-- vim.opt.wildmode = 'longest:full,full' -- Command-line completion behavior
-- vim.opt.shortmess:append('c')        -- Don't show completion messages in the command line

-- Diagnostic and Error
vim.diagnostic.config({
  virtual_text = true,               -- Inline diagnostic text (useful if you want quick error checks)
  signs = true,                      -- Show signs in the sign column
  underline = true,                  -- Underline diagnostics
  update_in_insert = false,          -- Update diagnostics only in normal mode for performance
  severity_sort = true,              -- Sort diagnostics by severity
})
