vim.g.config_path = vim.fn.stdpath('config')
vim.cmd("source  " .. vim.g.config_path .. "/vimscript/utils.vim")

require("config.lazy")  -- Package Manager
require("config.autocmds")
require("opts")

require("keymaps")
require('appearance')   -- Theme and UI


-- Statusline (Lualine)
require('lualine').setup {}


