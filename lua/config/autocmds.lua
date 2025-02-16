-- Enable spellcheck and text wrapping for gitcommit files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true       -- Enable spellchecking
        vim.opt_local.textwidth = 72     -- Wrap text at 72 characters
        vim.opt_local.wrap = true        -- Enable text wrapping
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Automatically reload buffers when switching branches
vim.api.nvim_create_autocmd("User", {
    pattern = "FugitiveHeadChanged",
    callback = function()
        vim.cmd("edit") -- Reload the buffer after a branch change
    end,
})

-- Enable specific settings for text-based filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rst",
              "rtf",
              "text",
              "markdown",
              "org",
              "latex",
              "gitcommit",
              "gitrebase",
              "asciidoc",
              "tex"
            },
  callback = function()
    -- Text Wrapping and Spell Checking for text-based files
    vim.opt_local.wrap = true               -- Enable text wrapping
    vim.opt_local.spell = true              -- Enable spell checking
    vim.opt_local.smartindent = false       -- Disable smartindent (no automatic indentation)
    vim.opt_local.cindent = false           -- Disable cindent (C-style indentation)
    vim.opt_local.cursorline = false        -- Don't highlight the current line
    vim.opt_local.breakindent = true        -- Indent wrapped lines visually
    vim.opt_local.linebreak = true          -- Wrap lines at words, not characters
    vim.opt_local.showbreak = "↪ "          -- Visual indication of wrapped lines
    vim.opt_local.expandtab = true          -- Use spaces instead of tabs
    vim.opt_local.shiftwidth = 2            -- Indent by 2 spaces
    vim.opt_local.tabstop = 2               -- Tab key inserts 2 spaces
  end,
  desc = "Enable text wrapping, spell checking, and basic formatting for text-based filetypes",
})

-- Disable settings specific to code-based filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Define a table for text-based filetypes for easier exclusion
    local text_types = {
      rst = true,
      rtf = true,
      text = true,
      markdown = true,
      org = true,
      latex = true,
      gitcommit = true,
      gitrebase = true,
      asciidoc = true,
      tex = true
    }

    -- Apply code-specific settings for non-text files
    if not text_types[vim.bo.filetype] then
      vim.opt_local.wrap = false              -- Disable text wrapping for code
      vim.opt_local.spell = false             -- Disable spell checking for code
      vim.opt_local.smartindent = true        -- Enable smartindent (automatic indentation)
      vim.opt_local.cindent = true            -- Enable cindent (C-style indentation)
      vim.opt_local.cursorline = true         -- Highlight the current line in code
      vim.opt_local.breakindent = false       -- Disable visual indent for wrapped lines
      vim.opt_local.expandtab = true          -- Use spaces for indentation in code
      vim.opt_local.shiftwidth = 4            -- Indent by 4 spaces for code
      vim.opt_local.tabstop = 4               -- Tab key inserts 4 spaces for code
      vim.opt_local.colorcolumn = "80"        -- Highlight the 80th column for code readability
    end
  end,
  desc = "Disable wrapping, spell checking, and enable code-specific settings for non-text-based filetypes",
})

-- automatically resize copen to 50
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    if vim.fn.winwidth(0) < 50 then
      vim.cmd('vertical resize 50')
    end
  end
})

