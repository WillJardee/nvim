local wk = require("which-key")
local harpoon = require("harpoon")

-- Define keymap options
local opts = { noremap = true, silent = true }
local toggle_telescope


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
    {'<leader>h', '<C-w>h', opts, desc = "Move to window up"},
    {'<leader>j', '<C-w>j', opts, desc = "Move to window down"},
    {'<leader>k', '<C-w>k', opts, desc = "Move to window left"},
    {'<leader>l', '<C-w>l', opts, desc = "Move to window right"},
    {'<leader>c', ':close<CR>', opts, desc = "Close"},
    {'<a-k>', ':lua vim.cmd("resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window up" },
    {'<a-j>', ':lua vim.cmd("resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window down" },
    {'<a-l>', ':lua vim.cmd("vertical resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window in" },
    {'<a-h>', ':lua vim.cmd("vertical resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window out" },
    {'<Leader>id', ':lua INSERT_DATE()<CR>', { noremap = true, silent = true }, desc = "Insert date"},
    {'<Leader>it', ':lua INSERT_TIME()<CR>', { noremap = true, silent = true }, desc = "Insert time"},
    {'<Leader>ij', ':lua INSERT_DATETIME()<CR>', { noremap = true, silent = true }, desc = "Insert date time"},
    {'<a-c>', ':close<CR>', opts, desc = "Close" },
  },
  { mode = {'t'},
    {'<a-c>', [[<C-\><C-n>:q<CR>]], opts, desc="Exit Terminal"}
  }
})

-- Telescope plugin keymaps
wk.add({
  { mode = {'n'},
    {'gd', vim.lsp.buf.definition, opts, desc = "jump to def" },
    {'<leader>fd', vim.diagnostic.open_float, opts, desc = "Show diagnostic at cursor"},
    {'<leader>ff', ':Telescope find_files<CR>', opts},
    {'<leader>fg', ':Telescope live_grep<CR>', opts},
    {'<leader>fb', ':Telescope buffers<CR>', opts},
    {'<leader>fh', ':Telescope help_tags<CR>', opts},
    {'<leader>pp', ':Telescope projects<CR>', opts},
    {'<leader>fe', ':NvimTreeToggle<CR>', opts},
    {'<leader>ga', function() harpoon:list():add() end, opts, desc = "Harpoon add"},
    {"<leader>gf", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts, desc = "Harpoon quick list"},
    {"<leader>gq", function() harpoon:list():select(1) end, opts, desc = "Harpoon add 1"},
    {"<leader>gw", function() harpoon:list():select(2) end, opts, desc = "Harpoon add 2"},
    {"<leader>ge", function() harpoon:list():select(3) end, opts, desc = "Harpoon add 3"},
    {"<leader>gr", function() harpoon:list():select(4) end, opts, desc = "Harpoon add 4"},
    {"<leader>gg", function() toggle_telescope(harpoon:list()) end, opts, desc = "Harpoon Telescope"},
    {"<leader>go", function() harpoon:list():prev() end, opts, desc = "Harpoon prev"},
    {"<leader>gi", function() harpoon:list():next() end, opts, desc = "Harpoon next"},
  }
})


-- LSP and degugging
wk.add({
  { mode = {'n'},
    {'gd', vim.lsp.buf.definition, opts, desc = "jump to def" },
    {'<leader>ee', vim.diagnostic.open_float, opts, desc = "Show diagnostic at cursor"},
    {'<leader>el', vim.diagnostic.setloclist, opts, desc = "List buffer diagnostics"},
    {'<leader>ew', vim.diagnostic.setqflist, opts, desc = "List workspace diagnostics"},
    {'<leader>en', vim.diagnostic.goto_next, opts, desc = "Next diagnostic"},
    {'<leader>ep', vim.diagnostic.goto_prev, opts, desc = "Previous diagnostic"},
    {'<leader>eh', vim.lsp.buf.hover, opts, desc = "Hover info (documentation)"},
    {'<leader>ed', vim.lsp.buf.hover, opts, desc = "Show signature help"},
    {'<leader>er', vim.lsp.buf.rename, opts, desc = "Rename symbol"},
    {'<leader>ef', vim.lsp.buf.rename, opts, desc = "Format buffer"},
    {'<leader>ei', vim.lsp.buf.incoming_calls, opts, desc = "Show incoming calls"},
    {'<leader>eo', vim.lsp.buf.outgoing_calls, opts, desc = "Show outgoing calls"},
  }
})

-- Themes
wk.add({
  { mode = {'n'} },
    {'<F5>', ':lua ToggleTheme(1)<CR>', opts, desc="Toggle theme +1."},
    {'<F4>', ':lua ToggleTheme(-1)<CR>', opts, desc="Toggle theme -1."},
    {'<F3>', ':lua ToggleLightMode()<CR>', opts, desc="Toggle light and dark mode"}
})

wk.add({
  { mode = {'n'} },
    {'<Leader>id', ':lua insert_date()<CR>', { noremap = true, silent = true }, desc = "Insert date"},
    {'<Leader>it', ':lua insert_time()<CR>', { noremap = true, silent = true }, desc = "Insert time"},
    {'<Leader>ij', ':lua insert_datetime()<CR>', { noremap = true, silent = true }, desc = "Insert date time"},
})


-- Function to insert the current date based on file type
function INSERT_DATE()
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

function INSERT_TIME()
    local format = "%H:%M (%Z)"

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursor
end

function INSERT_DATETIME()
    local format 
    local filetype = vim.bo.filetype  -- Get the current file's type

    if filetype == 'org' then
        format = "<%Y-%m-%d %H:%M>"  -- Org files use <yr-month-day>
    else
        format = "%Y/%m/%d %H:%M (%Z)"    -- Other files use yr-month-day
    end

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursorend
end

-- basic telescope configuration
local conf = require("telescope.config").values
function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end


