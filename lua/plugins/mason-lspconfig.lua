return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local ensured_servers = {
      jdtls = {
        filetyptes = { 'java' },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict",   -- Options: "off", "basic", or "strict"
              autoSearchPaths = true,       -- Automatically search Python paths
              useLibraryCodeForTypes = true, -- Use library code for type information
              diagnosticMode = "workspace",  -- Diagnose the whole workspace
            },
          },
        },
      },
      -- rust_analyzer = {},
      clangd = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,  -- Disable telemetry (optional)
            },
          },
        },
      },
    }
    local servers = {
      clangd = {
        cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
        single_file_support = true,
      },
      jdtls = {},
      tsserver = {},
      phpactor = {},
      pyright = {},
    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(ensured_servers),
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
