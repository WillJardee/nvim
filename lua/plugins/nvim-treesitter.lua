return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  ensure_installed = {"python"}, -- Add languages here
  highlight = { enable = true },
  ignore_install = { 'org' }
}
