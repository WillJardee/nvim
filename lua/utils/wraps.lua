-- Enable wrap for specific text-like file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "org",
              "markdown",
              "text",
              "tex",
              "latex",
              "asciidoc",
              "rst",
              "norg",
              "xml",
              -- "html",
              "pandoc"
            },
  callback = function()
    vim.wo.wrap = true         -- Enable wrapping for these file types
    vim.wo.linebreak = true    -- Wrap lines at word boundaries
    -- vim.bo.textwidth = 80      -- Set text width if you want auto line breaks (optional)
  end,
})

