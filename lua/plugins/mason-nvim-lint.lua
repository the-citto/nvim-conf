
local M = {
    "rshkarin/mason-nvim-lint",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-lint",
    },
}

M.config = function()
    require ("mason-nvim-lint").setup{
        -- ensure_installed = {
        --     "cpplint",
        --     "cmakelang",
        --     "cmakelint",
        --     "curlylint",
        --     "eslint_d",
        --     "luacheck",
        --     "mypy",
        --     "pydocstyle",
        --     "pylint",
        --     "pyproject-flake8",
        --     "shellcheck",
        --     "shellharden",
        --     "sqlfluff",
        --     "standardjs",
        --     "stylelint",
        --     "ts-standard",
        --     "typos",
        --     "yamllint",
        -- },
    }
end

return M

