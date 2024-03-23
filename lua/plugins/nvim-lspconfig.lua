
local M = {
    'neovim/nvim-lspconfig',
    cmd = {
        'LspInfo', 
        'LspInstall', 
        'LspStart', 
    },
    event = {
        'BufReadPre', 
        'BufNewFile',
    },
    dependencies = {
        {'folke/neoconf.nvim'}, 
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
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
            globals = { 'vim' },
            disable = { 
                'trailing-space', 
                'deprecated', 
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

local clang_settings = {}
local html_settings = {}
local jsonls_settings = {} 
local omnisharp_settings = {}
local pyright_settings = {} 
local r_language_server_settings = {}
local rust_analyzer_settings = {}
local volar_settings = {}
local tsserver_settings = {}

M.config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- -- local on_attach_custom = function(client, bufnr)
    -- --     local function buf_set_option(name, value) vim.api.nvim_buf_set_option(bufnr, name, value) end
    -- --     buf_set_option('omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')
    -- --     -- Mappings are created globally for simplicity
    -- --     -- Currently all formatting is handled with 'null-ls' plugin
    -- --     -- if vim.fn.has('nvim-0.8') == 1 then
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
    --     --     severity = { min = 'WARN', max = 'ERROR' },
    --     -- },
    --     -- Show virtual text only for errors
    --     virtual_text = { severity = { min = 'WARN', max = 'ERROR' } },
    --     underline = { severity = { min = 'WARN', max = 'ERROR' } },
    --     update_in_insert = false,
    -- }
    -- vim.diagnostic.config(diagnostic_opts)

    lspconfig.autotools_ls.setup { capabilities = capabilities, }
    lspconfig.clangd.setup { capabilities = capabilities, settings = clang_settings }
    lspconfig.cssls.setup { capabilities = capabilities, settings = css_settings }
    -- lspconfig.eslint.setup { capabilities = capabilities, }
    lspconfig.html.setup { capabilities = capabilities, settings = html_settings }
    lspconfig.htmx.setup { capabilities = capabilities, }
    lspconfig.jsonls.setup { capabilities = capabilities, settings = jsonls_settings }
    lspconfig.lua_ls.setup { capabilities = capabilities, settings = lua_settings } 
    lspconfig.omnisharp.setup { capabilities = capabilities, settings = omnisharp_settings }
    lspconfig.pyright.setup { capabilities = capabilities, settings = pyright_settings }
    lspconfig.r_language_server.setup { capabilities = capabilities, settings = r_language_server_settings }
    -- lspconfig.ruff_lsp.setup { capabilities = capabilities, }
    lspconfig.rust_analyzer.setup { capabilities = capabilities, settings = rust_analyzer_settings }
    lspconfig.sqlls.setup { capabilities = capabilities, }
    lspconfig.taplo.setup { capabilities = capabilities, }
    lspconfig.volar.setup { capabilities = capabilities, settings = volar_settings }
    lspconfig.tsserver.setup { capabilities = capabilities, settings = tsserver_settings }
end 


return M

