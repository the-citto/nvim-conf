
local M = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
}

M.config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "css",
            "csv",
            "dockerfile",
            "fortran",
            "gitignore",
            "go",
            "html",
            "htmldjango",
            -- "jinja2",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "make",
            "markdown",
            "powershell",
            "python",
            "query",
            "r",
            "regex",
            "rust",
            "scss",
            "sql",
            -- "sqlite",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true
        },
        autotag = {
            enable = true,
        }
    })
end

return M

