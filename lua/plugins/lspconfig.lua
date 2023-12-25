
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
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason-lspconfig.nvim'},
    },
} 

M.config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.lua_ls.setup {
        -- capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 
                        'vim' 
                    },
                    disable = { 
                        'trailing-space', 
                        'deprecated' 
                    },
                },
            },
        }
    } 
    lspconfig.pyright.setup {
        capabilities = capabilities,
    } 
    -- lspconfig.jedi_language_server.setup {
    --     capabilities = capabilities,
    -- } 
end 

return M

