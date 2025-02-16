return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },
  -- https://www.lazyvim.org/extras/dap/core
  -- config = function()
  --   -- load mason-nvim-dap here, after all adapters have been setup
  --   if LazyVim.has("mason-nvim-dap.nvim") then
  --     require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
  --   end
  --
  --   vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
  --
  --   for name, sign in pairs(LazyVim.config.icons.dap) do
  --     sign = type(sign) == "table" and sign or { sign }
  --     vim.fn.sign_define(
  --       "Dap" .. name,
  --       { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  --     )
  --   end
  --
  --   -- setup dap config by VsCode launch.json file
  --   local vscode = require("dap.ext.vscode")
  --   local json = require("plenary.json")
  --   vscode.json_decode = function(str)
  --     return vim.json.decode(json.json_strip_comments(str))
  --   end
  -- end,
}
