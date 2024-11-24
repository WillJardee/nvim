vim.cmd('source ~/.config/nvim/vimscript/utils.vim')

require("config.lazy")  -- Package Manager
require("config.autocmds")
require("opts")

require("keymaps")
require('appearance')   -- Theme and UI


-- Statusline (Lualine)
require('lualine').setup {}

require('utils.wraps')

