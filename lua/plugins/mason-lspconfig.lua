
local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            -- 'ast_grep', --- ast-grep
            'autotools_ls', --- Automake --- Autoconf --- Make
            'bashls', --- Bash
            'biome', --- JSON --- JavaScript --- TypeScript
            'clangd', --- C --- C++
            -- 'cmake', --- CMake
            -- 'csharp_ls', --- C#
            'cssls', --- CSS
            'cssmodules_ls', --- CSS
            -- 'diagnosticls', --- Diagnostic (general purpose server)
            'docker_compose_language_service', --- Docker Compose
            'dockerls', --- Docker
            -- 'dotls', --- Dot
            'eslint', --- ESLint
            'facility_language_server', --- Facility Service Definition
            -- 'fsautocomplete', --- F#
            -- 'golangci_lint_ls', --- Go
            -- 'gopls', --- Go
            -- 'graphql', --- GraphQL
            -- 'hdl_checker', --- HDL
            'html', --- HTML
            'htmx', --- HTMX
            --'hydra_lsp', --- YAML
            --'jedi_language_server', --- Python
            --'jsonls', --- JSON
            'lemminx', --- XML
            'lua_ls', --- Lua
            -- 'marksman', --- Markdown
            --'mm0_ls', --- Metamath Zero
            --'neocmake', --- CMake
            'omnisharp', --- C# (docs)
            --'omnisharp_mono', --- C# (docs)
            --'pkgbuild_language_server', --- Bash
            'powershell_es', --- Powershell
            --'prosemd_lsp', --- Markdown
            --'purescriptls', --- PureScript
            --'pylsp', --- Python (docs)
            --'pylyzer', --- Python
            --'pyre', --- Python
            'pyright', --- Python
            -- 'quick_lint_js', --- JavaScript
            --'r_language_server', --- R
            -- 'remark_ls', --- Markdown
            --'robotframework_ls', --- Robot Framework
            --'ruff_lsp', --- Python
            'rust_analyzer', --- Rust
            --'sourcery', --- Python
            --'spectral', --- OpenAPI
            'sqlls', --- SQL
            --'sqls', --- SQL
            'tailwindcss', --- Tailwind CSS
            'taplo', --- TOML
            'tsserver', --- JavaScript --- TypeScript
            'typos_lsp', --- all
            --'typst_lsp', --- Typst
            --'unocss', --- CSS
            --'vale_ls', --- Markdown
            -- 'volar', --- Vue
            --'vtsls', --- JavaScript --- TypeScript
            'vuels', --- Vue
            --'wgsl_analyzer', --- WGSL
            'yamlls', --- YAML
            --'zk', --- Markdown
            --'zls', --- Zig
        },
    }
}

return M 



