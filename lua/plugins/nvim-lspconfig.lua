

local M = {
    "neovim/nvim-lspconfig",
--     cmd = {
--         "LspInfo",
--         "LspInstall",
--         "LspStart",
--     },
--     event = {
--         "BufReadPre",
--         "BufNewFile",
--     },
    dependencies = {
--         -- {"folke/neoconf.nvim"},
--         -- {"hrsh7th/cmp-nvim-lsp"},
        {"williamboman/mason-lspconfig.nvim"},
        {"saghen/blink.cmp"},
    },
}

M.config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()
--     -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--     -- for server, config in pairs(opts.servers) do
--     --   -- passing config.capabilities to blink.cmp merges with the capabilities in your
--     --   -- `opts[server].capabilities, if you've defined it
--     --   config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
--     --   lspconfig[server].setup(config)
--     -- end
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     local diagnostic_opts = {
--         virtual_text = true,
--         underline = false,
--     }
--     vim.diagnostic.config(diagnostic_opts)
--     lspconfig.clangd.setup { capabilities = capabilities }
--     lspconfig.cssls.setup { capabilities = capabilities }
--     lspconfig.docker_compose_language_service.setup { capabilities = capabilities }
--     lspconfig.dockerls.setup { capabilities = capabilities }
--     lspconfig.gopls.setup { capabilities = capabilities }
--     lspconfig.html.setup { capabilities = capabilities }
--     lspconfig.htmx.setup { capabilities = capabilities }
--     lspconfig.jinja_lsp.setup { capabilities = capabilities }
--     lspconfig.jsonls.setup { capabilities = capabilities }
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                    disable = {
                        "missing-fields",
                    },
                },
            },
        }
    }
--     lspconfig.marksman.setup { capabilities = capabilities }
    -- lspconfig.pylsp.setup {
    --     capabilities = capabilities,
    --     settings = {
    --         pylsp = {
    --             plugins = {
    --                 pycodestyle = { enabled = false },
    --                 pyflakes = { enabled = false },
    --                 pylsp_mypy = {
    --                     enable = true,
    --                     -- overrides = { "--python-executable", ".venv/bin/python", true },
    --                     -- report_progress = true,
    --                 },
    --             },
    --         },
    --     },
    -- }
    lspconfig.pyright.setup { capabilities = capabilities }
    lspconfig.ruff.setup { capabilities = capabilities }
--     lspconfig.sqlls.setup { capabilities = capabilities }
--     lspconfig.taplo.setup { capabilities = capabilities }
--     lspconfig.tailwindcss.setup { capabilities = capabilities }
--     lspconfig.volar.setup { capabilities = capabilities }
--     lspconfig.ts_ls.setup { capabilities = capabilities }
--     lspconfig.yamlls.setup { capabilities = capabilities }
--     vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--         callback = function(ev)
--             vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--         end,
--     })
end


return M

