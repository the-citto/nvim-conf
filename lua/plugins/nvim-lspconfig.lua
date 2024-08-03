
local M = {
    "neovim/nvim-lspconfig",
    cmd = {
        "LspInfo",
        "LspInstall",
        "LspStart",
    },
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        {"folke/neoconf.nvim"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
    },
}


--- refs
-- https://github.com/folke/neoconf.nvim?tab=readme-ov-file#-supported-language-servers

--- R Language Server (lintr)
-- https://github.com/REditorSupport/vscode-R/wiki/R-Language-Service
-- https://github.com/REditorSupport/vscode-r-lsp/blob/master/package.json
-- https://cran.r-project.org/web/packages/lintr/vignettes/lintr.html
-- https://lintr.r-lib.org/reference/linters.html

--- Lua
-- https://github.com/LuaLS/vscode-lua/blob/master/package.json
local lua_settings = {
    Lua = {
        diagnostics = {
            globals = { "vim" },
            disable = {
                "missing-fields",
                -- "trailing-space", 
                -- "deprecated", 
            },
        },
    },
}

--- CSS
-- https://github.com/microsoft/vscode/blob/main/extensions/css-language-features/package.json
local css_settings = {
    scss = {
        --     lint = {
        --         idSelector = "warning",
        --     },
    },
}

local autotools_settings = {}
local clang_settings = {}
local html_settings = {}
local jinja_lsp_settings = {}
local jsonls_settings = {}
local omnisharp_settings = {}
local pyright_settings = {
    -- typeCheckingMode = "basic",
}
local r_language_server_settings = {}
local rust_analyzer_settings = {}
local volar_settings = {}
local tsserver_settings = {}

M.config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- -- local on_attach_custom = function(client, bufnr)
    -- --     local function buf_set_option(name, value) vim.api.nvim_buf_set_option(bufnr, name, value) end
    -- --     buf_set_option("omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
    -- --     -- Mappings are created globally for simplicity
    -- --     -- Currently all formatting is handled with "null-ls" plugin
    -- --     -- if vim.fn.has("nvim-0.8") == 1 then
    -- --     --     client.server_capabilities.documentFormattingProvider = false
    -- --     --     client.server_capabilities.documentRangeFormattingProvider = false
    -- --     -- else
    -- --     --     client.resolved_capabilities.document_formatting = false
    -- --     --     client.resolved_capabilities.document_range_formatting = false
    -- --     -- end
    -- -- end
    -- local diagnostic_opts = {
    --     -- Show gutter sings
    --     -- signs = {
    --     --     -- With highest priority
    --     --     -- priority = 9999,
    --     --     -- Only for warnings and errors
    --     --     severity = { min = "WARN", max = "ERROR" },
    --     -- },
    --     -- Show virtual text only for errors
    --     virtual_text = { severity = { min = "WARN", max = "ERROR" } },
    --     underline = { severity = { min = "WARN", max = "ERROR" } },
    --     update_in_insert = false,
    -- }
    -- vim.diagnostic.config(diagnostic_opts)

    lspconfig.autotools_ls.setup { capabilities = capabilities, settings = autotools_settings }
    lspconfig.clangd.setup { capabilities = capabilities, settings = clang_settings }
    lspconfig.cssls.setup { capabilities = capabilities, settings = css_settings }
    -- lspconfig.eslint.setup { capabilities = capabilities, }
    lspconfig.docker_compose_language_service.setup { capabilities = capabilities, }
    lspconfig.dockerls.setup { capabilities = capabilities, }
    lspconfig.html.setup { capabilities = capabilities, settings = html_settings }
    lspconfig.htmx.setup { capabilities = capabilities, }
    lspconfig.jinja_lsp.setup { capabilities = capabilities, settings = jinja_lsp_settings }
    lspconfig.jsonls.setup { capabilities = capabilities, settings = jsonls_settings }
    lspconfig.lua_ls.setup { capabilities = capabilities, settings = lua_settings }
    lspconfig.marksman.setup { capabilities = capabilities }
    lspconfig.omnisharp.setup { capabilities = capabilities, settings = omnisharp_settings }
    lspconfig.pyright.setup { capabilities = capabilities, settings = pyright_settings }
    lspconfig.r_language_server.setup { capabilities = capabilities, settings = r_language_server_settings }
    lspconfig.ruff_lsp.setup { capabilities = capabilities, }
    lspconfig.rust_analyzer.setup { capabilities = capabilities, settings = rust_analyzer_settings }
    lspconfig.sqlls.setup { capabilities = capabilities, }
    lspconfig.taplo.setup { capabilities = capabilities, }
    lspconfig.volar.setup { capabilities = capabilities, settings = volar_settings }
    lspconfig.tsserver.setup { capabilities = capabilities, settings = tsserver_settings }
    lspconfig.yamlls.setup { capabilities = capabilities }
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            -- local opts = { buffer = ev.buf }
            local buffer = ev.buf
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { buffer = buffer, desc = "jump to definition" })
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            -- vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { buffer = buffer, desc = "signature help" })
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            -- vim.keymap.set('n', '<space>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, opts)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            -- vim.keymap.set('n', '<space>f', function()
            --     vim.lsp.buf.format { async = true }
            -- end, opts)
        end,
    })
end


return M

