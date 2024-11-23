return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "<C-k>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<C-j>", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
      backends = {
        -- ...
        ["sty"] = "latex",
      },

      default_direction = "prefer_left", --this is not workign
      close_automatic_events = {"unsupported"},
      max_width = {30, 0.15},
    })
  end
}
