local wk = require("which-key")

-- Define keymap options
local opts = { noremap = true, silent = true }


-- -- LSP keymaps (to be used in LSP-attached buffers)
-- on_attach = function(client, bufnr)
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
-- end

-- Don't forget to pass `on_attach` to your LSP config in lsp.lua

-- General keymaps
wk.add({
  { mode = {'n'},
    {'<leader>w', ':w<CR>', opts, desc = "save file" },
    {'<leader>q', ':q<CR>', opts, desc = "quit file" },
    {'<leader>x', ':x<CR>', opts, desc = "save-quit file" },
    {'gd', vim.lsp.buf.definition, opts, desc = "jump to def" },
    {'<leader>h', '<C-w>h', opts, desc = "Move to window up"},
    {'<leader>j', '<C-w>j', opts, desc = "Move to window down"},
    {'<leader>k', '<C-w>k', opts, desc = "Move to window left"},
    {'<leader>l', '<C-w>l', opts, desc = "Move to window right"},
    {'<leader>c', ':close<CR>', opts},
    {'<a-k>', ':lua vim.cmd("resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window up" },
    {'<a-j>', ':lua vim.cmd("resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window down" },
    {'<a-l>', ':lua vim.cmd("vertical resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window in" },
    {'<a-h>', ':lua vim.cmd("vertical resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window out" },
    {'<Leader>id', ':lua insert_date()<CR>', { noremap = true, silent = true }, desc = "Insert date"},
    {'<Leader>it', ':lua insert_time()<CR>', { noremap = true, silent = true }, desc = "Insert time"},
    {'<Leader>ij', ':lua insert_datetime()<CR>', { noremap = true, silent = true }, desc = "Insert date time"},
    {'<a-c>', ':close<CR>', opts, desc = "Close" },
  },
})

-- Telescope plugin keymaps
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>pp', ':Telescope projects<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fe', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F5>', ':lua ToggleTheme()<CR>', { noremap = true, silent = true })



-- Function to insert the current date based on file type
function insert_date()
    local format
    local filetype = vim.bo.filetype  -- Get the current file's type

    if filetype == 'org' then
        format = "<%Y-%m-%d>"  -- Org files use <yr-month-day>
    else
        format = "%Y/%m/%d"    -- Other files use yr-month-day
    end

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursor
end

function insert_time()
    local format = "%H:%M (%Z)"

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursor
end

function insert_datetime()
    local format 
    local filetype = vim.bo.filetype  -- Get the current file's type

    if filetype == 'org' then
        format = "<%Y-%m-%d %H%M>"  -- Org files use <yr-month-day>
    else
        format = "%Y/%m/%d %H:%M (%Z)"    -- Other files use yr-month-day
    end

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursorend
end
