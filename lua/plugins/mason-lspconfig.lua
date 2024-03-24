
local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    opts = {
        ensure_installed = {
            -- "autotools_ls",         -- Make 
            -- "clangd",               -- C -- C++
            -- "cssls",
            -- "dockerls",             -- Docker 
            -- "docker_compose_language_service",  -- Docker Compose
            -- "eslint",
            -- "fortls",               -- Fortran
            -- "gopls",                -- Go
            -- "html",
            -- "htmx",
            -- "lua_ls",               -- Lua
            -- "jedi_language_server", -- Python
            -- "jsonls", 
            -- -- "mypy",              -- Python
            -- "omnisharp",            -- C#
            -- -- "pylsp",             -- Python
            -- "pylyzer",              -- Python
            -- -- "pyre",              -- Python
            -- "pyright",              -- Python
            -- -- "sourcery",          -- Python
            -- "r_language_server",    -- R
            -- "rust_analyzer",        -- Rust
            -- "taplo",                -- TOML
            -- "tsserver",             -- JavaScript -- TypeScript
            -- "volar",                -- Vue
        },
        automatic_installation = true
    }
}

return M



