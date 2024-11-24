return {
  "tpope/vim-fugitive",
  lazy = true, -- Load only when needed (optional if you want better performance)
  cmd = { "Git", "Gdiffsplit", "Gwrite", "Gread", "Ggrep" }, -- Command triggers
  event = "BufReadPre", -- Load Fugitive when a file is read
  config = function()

  end
}
