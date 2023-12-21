
local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        -- 'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            'tsserver',             -- JavaScript -- TypeScript
            'lua_ls',               -- Lua
            'jedi_language_server', -- Python
            'mypy',                 -- Python
            -- 'pylsp',             -- Python
            'pylyzer',              -- Python
            -- 'pyre',              -- Python
            'pyright',              -- Python
            -- 'sourcery',          -- Python
            'rust_analyzer',        -- Rust
            'taplo',                -- TOML
        },
    }
}

return M 



