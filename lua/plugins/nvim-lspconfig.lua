

local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        {"williamboman/mason-lspconfig.nvim"},
        {"saghen/blink.cmp"},
    },
}

M.config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig.clangd.setup { capabilities = capabilities }
    lspconfig.cssls.setup { capabilities = capabilities }
    lspconfig.docker_compose_language_service.setup { capabilities = capabilities }
    lspconfig.dockerls.setup { capabilities = capabilities }
    lspconfig.gh_actions_ls.setup { capabilities = capabilities }
    lspconfig.golangci_lint_ls.setup { capabilities = capabilities }
    lspconfig.gopls.setup { capabilities = capabilities }
    lspconfig.html.setup { capabilities = capabilities }
    lspconfig.htmx.setup { capabilities = capabilities }
    lspconfig.jinja_lsp.setup { capabilities = capabilities }
    lspconfig.jsonls.setup { capabilities = capabilities }
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
    lspconfig.marksman.setup { capabilities = capabilities }
    lspconfig.pyright.setup { capabilities = capabilities }
    -- lspconfig.ruff.setup { capabilities = capabilities }
    lspconfig.rust_analyzer.setup { capabilities = capabilities }
    lspconfig.sqlls.setup { capabilities = capabilities }
    lspconfig.taplo.setup { capabilities = capabilities }
    lspconfig.tailwindcss.setup { capabilities = capabilities }
    lspconfig.volar.setup { capabilities = capabilities }
    lspconfig.terraformls.setup { capabilities = capabilities }
    lspconfig.ts_ls.setup { capabilities = capabilities }
    lspconfig.yamlls.setup { capabilities = capabilities }
    vim.diagnostic.config{
        virtual_text = true,
        underline = false,
    }
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local buffer = ev.buf
            vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { buffer = buffer, desc = "jump to definition" })
        end,
    })
end


return M

