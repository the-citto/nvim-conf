

require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { 
        "eslint",
        "lua_ls", 
        "pyright",
        "rust_analyzer",
        "tsserver",
    },
}


