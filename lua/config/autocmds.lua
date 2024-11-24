-- Enable spellcheck and text wrapping for gitcommit files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true       -- Enable spellchecking
        vim.opt_local.textwidth = 72     -- Wrap text at 72 characters
        vim.opt_local.wrap = true        -- Enable text wrapping
    end,
})

-- Automatically reload buffers when switching branches
vim.api.nvim_create_autocmd("User", {
    pattern = "FugitiveHeadChanged",
    callback = function()
        vim.cmd("edit") -- Reload the buffer after a branch change
    end,
})
