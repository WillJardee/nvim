local wk = require("which-key")
local harpoon = require("harpoon")

-- local makefile_telescope = require(".utils.telescope_makefile")

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
    {'<leader>d', ':bd<CR>', opts, desc = "close buffer"},
    {'<leader>n', ':nohlsearch<CR>', opts, desc = "clear highlights" },
    {'<leader>h', '<C-w>h', opts, desc = "Move to window up"},
    {'<leader>j', '<C-w>j', opts, desc = "Move to window down"},
    {'<leader>k', '<C-w>k', opts, desc = "Move to window left"},
    {'<leader>l', '<C-w>l', opts, desc = "Move to window right"},
    {'<leader>c', ':close<CR>', opts, desc = "Close"},
    {'<a-k>', ':lua vim.cmd("resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window up" },
    {'<a-j>', ':lua vim.cmd("resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window down" },
    {'<a-l>', ':lua vim.cmd("vertical resize -2")<cr>', { noremap = true, silent = true }, desc = "Move window in" },
    {'<a-h>', ':lua vim.cmd("vertical resize +2")<cr>', { noremap = true, silent = true }, desc = "Move window out" },
    {'<leader>igq', 'Vipgq<CR>', opts, desc = "Format paragraph" },
    {'<Leader>id', ':lua INSERT_DATE()<CR>', { noremap = true, silent = true }, desc = "Insert date"},
    {'<Leader>it', ':lua INSERT_TIME()<CR>', { noremap = true, silent = true }, desc = "Insert time"},
    {'<Leader>ij', ':lua INSERT_DATETIME()<CR>', { noremap = true, silent = true }, desc = "Insert date time"},
    {'<a-c>', ':close<CR>', opts, desc = "Close" },
  },
  { mode = {'t'},
    {'<a-c>', [[<C-\><C-n>:q<CR>]], opts, desc="Exit Terminal"}
  },
  { mode = {'v'},
    {'<Leader>li', ':lua incrementletters()<CR>', { noremap = true, silent = true }, desc = "Increment selected characters by 1"},
  }
})

-- Telescope plugin keymaps
wk.add({
  { mode = {'n'},
    { "<leader>f", "", desc = "+find"},
    {'<leader>fd', vim.diagnostic.open_float, opts, desc = "Show diagnostic at cursor"},
    {'<leader>ff', ':Telescope find_files<CR>', opts},
    {'<leader>fg', ':Telescope live_grep<CR>', opts},
    {'<leader>fb', ':Telescope buffers<CR>', opts},
    {'<leader>fh', ':Telescope help_tags<CR>', opts},
    {'<leader>fm', ':Telescope make<CR>', opts},
    {'<leader> ',  ':lua vim.cmd("!make")<CR>', opts},
    {'<leader>fp', ':Telescope projects<CR>', opts},
    {'<leader>fe', ':NvimTreeToggle<CR>', opts},
    {'<leader>fl', '<cmd>AerialToggle!<CR>', opts, desc="Toggle Aerial"},
    -- {'<leader>pr', open_readme, opts, desc="Open project readme"},
    -- {"<leader>gq", function() harpoon:list():select(1) end, opts, desc = "Harpoon add 1"},
    -- {"<leader>gw", function() harpoon:list():select(2) end, opts, desc = "Harpoon add 2"},
    -- {"<leader>ge", function() harpoon:list():select(3) end, opts, desc = "Harpoon add 3"},
    -- {"<leader>gr", function() harpoon:list():select(4) end, opts, desc = "Harpoon add 4"},
    { "<leader>g", "", desc = "+file movement"},
    {'gd', vim.lsp.buf.definition, opts, desc = "jump to def" },
    {"<leader>gf", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts, desc = "Harpoon quick list"},
    {"<leader>ga", ":lua require('harpoon.mark').add_file()<CR>", opts, desc = "Harpoon quick list"},
    {"<leader>gg", ":Telescope harpoon marks<CR>", opts, desc = "Harpoon Telescope"},
    {"<leader>go", ":lua require('harpoon.ui').nav_next()<CR>", opts, desc = "Harpoon prev"},
    {"<leader>gi", ":lua require('harpoon.ui').nav_prev()<CR>", opts, desc = "Harpoon next"},
  }
})


-- LSP and degugging
wk.add({
  { mode = {'n'},
    { "<leader>e", "", desc = "+error handling", icon={ icon = "" }},
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

wk.add({
  { mode = {'n'},
    { "<leader>s", "", group = "spell", icon={ icon = "\u{F168C}" }},
    {'<leader>su', ":GrammarousCheck<CR>", opts, desc = "Grammarous Check"},
    {'<leader>sr', ":GrammarousReset<CR>", opts, desc = "Grammarous Reset"},
    {'<leader>sf', "<Plug>(grammarous-fixit)", opts, desc = "Fit it"},
    {'<leader>sd', "<Plug>(grammarous-open-info-window)", opts, desc = "Open info window"},
    {'<leader>sq', "<Plug>(grammarous-close-info-window)", opts, desc = "Close info window"},
    {'<leader>sj', "<Plug>(grammarous-move-to-next-error)", opts, desc = "Move to next error"},
    {'<leader>sk', "<Plug>(grammarous-move-to-previous-error)", opts, desc = "Move to previous error"},
  }
})



-- wk.add({
--   { mode = {"n", "v"},
--     { "<leader>d", "", desc = "+debug"},
--     { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
--     { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
--     { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
--     { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
--     { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
--     { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
--     { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
--     { "<leader>dj", function() require("dap").down() end, desc = "Down" },
--     { "<leader>dk", function() require("dap").up() end, desc = "Up" },
--     { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
--     { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
--     { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
--     { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
--     { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
--     { "<leader>ds", function() require("dap").session() end, desc = "Session" },
--     { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
--     { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
--   },
-- })


wk.add({
  { mode = {"n", "v"},
    {"<leader>p", "", desc="Git"},
    {"<leader>pa", ":Gwrite<CR>", opts, desc="Add file to stages"},
    {"<leader>ps", ":G<CR>", opts, desc="Git Status"},
    {"<leader>pc", ":Git commit<CR>", opts, desc="Git Commit"},
    {"<leader>pp", ":Git pull<CR>", opts, desc="Git Pull"},
    {"<leader>pP", ":Git push<CR>", opts, desc="Git Push"},
    {"<leader>pb", ":Gitsigns blame<CR>", opts, desc="Git Blame"},
    {"<leader>pf", ":Gdiffsplit<CR>", opts, desc="Open Git diff"},
    {"<leader>pm", ":Gmerge<CR>", opts, desc="Open Git merge tool"},
    {"<leader>pl", ":Git log<CR>", opts, desc="Show Git log"},
    -- {"<leader>pr", ":Git restore<CR>", opts, desc="Git restore"},
    {"<leader>pt", ":Git stash<CR>", opts, desc="Git stash"},
    {"<leader>pT", ":Git stash pop<CR>", opts, desc="Pop Git stashed changes"},
    {"<leader>ph", ":Gitsigns get_hunks<CR>", opts, desc="Next Git hunk"},
    {"<leader>pn", ":lua require('gitsigns').nav_hunk('next')<CR>", opts, desc="Next Git hunk"},
    {"<leader>pN", ":lua require('gitsigns').nav_hunk('prev')<CR>", opts, desc="Prev Git hunk"},
    {"<leader>pr", ":Gitsigns reset_hunk<CR>", opts, desc="Prev Git hunk"},
    {"<leader>pu", ":Gitsigns stage_hunk<CR>", opts, desc="Stage Git hunk"},
    {"<leader>pU", ":Gitsigns undo_stage_hunk<CR>", opts, desc="Undo stage Git hunk"},
  },
})

-- Themes
wk.add({
  { mode = {'n'} },
    {'<F5>', ':lua ToggleTheme(1)<CR>', opts, desc="Toggle theme +1."},
    {'<F4>', ':lua ToggleTheme(-1)<CR>', opts, desc="Toggle theme -1."},
    {'<F6>', ':lua ToggleLightMode()<CR>', opts, desc="Toggle light and dark mode"}
})

wk.add({
  { mode = {'n'} },
    {'<Leader>id', ':lua INSERT_DATE()<CR>', { noremap = true, silent = true }, desc = "Insert date"},
    {'<Leader>it', ':lua INSERT_TIME()<CR>', { noremap = true, silent = true }, desc = "Insert time"},
    {'<Leader>ij', ':lua INSERT_DATETIME()<CR>', { noremap = true, silent = true }, desc = "Insert date time"},
})


vim.api.nvim_create_user_command('ProfileLinePython', function(opts)
  local file = vim.fn.expand('%')
  vim.cmd('!kernprof -l -v -z ' .. file .. ' > /tmp/profile_output.txt')
  vim.cmd('cfile /tmp/profile_output.txt')
  vim.cmd('vert copen')
end, { nargs = 0 })

vim.api.nvim_create_user_command('ProfilePython', function(opts)
  local file = vim.fn.expand('%')
  local output_file = "/tmp/profile_output.txt.prof"
  vim.cmd('!kernprof -b -o /tmp/profile_output.prof ' .. file)
  vim.fn.system(string.format("python3 -c 'import pstats; p = pstats.Stats(\"%s\"); p.strip_dirs().sort_stats(\"cumulative\").print_stats(20)' > %s ", "/tmp/profile_output.prof", output_file))
  vim.cmd(':vs ' .. output_file)
  vim.cmd(':set nowrap')
  vim.cmd(':set nospell')
end, { nargs = 0 })

wk.add({
    {mode = { 'n' } },
    {'<Leader>rL', ":ProfileLinePython<CR>", { noremap = true, silent = true }, desc = "Profile Python (kernprof)"},
    {'<Leader>rP', ":ProfilePython<CR>", { noremap = true, silent = true }, desc = "Profile Python (kernprof)"},
})


-- Function to insert the current date based on file type
function INSERT_DATE()
    local format
    local filetype = vim.bo.filetype  -- Get the current file's type

    if filetype == 'org' then
        format = "<%Y-%m-%d>"  -- Org files use <yr-month-day>
    elseif filetype == 'markdown' then
        format = "%Y-%m-%d"  -- Org files use <yr-month-day>
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
    elseif filetype == 'markdown' then
        format = "%Y-%m-%d %H:%M"  -- Org files use <yr-month-day>
    else
        format = "%Y/%m/%d %H:%M (%Z)"    -- Other files use yr-month-day
    end

    local date = os.date(format)  -- Formats the date according to the file type
    vim.api.nvim_put({ date }, 'c', true, true)  -- Inserts the date at the cursorend
end

-- -- define function to increment letters by 1 alphabetically
-- function incrementletters()
--   -- Get the current visual selection from the default register
--   local selection = vim.fn.getreg('"')  -- Default register after visual mode
--   local new_selection = ""
--
--   -- Loop through each character in the selection
--   for i = 1, #selection do
--     local char = selection:sub(i, i)
--     local incremented_char = string.char(string.byte(char) + 1)
--     new_selection = new_selection .. incremented_char
--   end
--
--   -- Echo the new selection for debugging
--   vim.api.nvim_out_write("New selection: " .. new_selection .. "\n")
--
--   -- Set the new selection back into the register
--   vim.fn.setreg('"', new_selection)  -- Put the modified text back into the default register
-- end
