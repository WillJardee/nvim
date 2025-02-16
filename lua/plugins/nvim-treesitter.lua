return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  ensure_installed = {"python",
                      "lua",
                      "java",
                      "c",
                      "cpp",
                      "markdown",
                      "bash",
                      "make",
                      "cmake",
                      "tex",
                    }, -- Add languages here
  highlight = { enable = true },
  ignore_install = { 'org' }
}

