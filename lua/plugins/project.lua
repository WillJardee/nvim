return {
  'ahmedkhalf/project.nvim',
  config = function()
    require("project_nvim").setup {
      detection_methods = { "pattern", "lsp" },
      patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        "pyproject.toml",
        "=nvim"
      },
      -- exclude_dirs = {"~/.backup/*"},
    }
  end
}
