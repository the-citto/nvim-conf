

local M = {
    "mfussenegger/nvim-lint",
    dependencies = {
        "williamboman/mason.nvim",
    },
    -- event = {
    --     "BufReadPre",
    --     "BufNewFile",
    -- },
}

M.config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        -- lua = { "luacheck", },
        python = {
            -- "ruff",
            "mypy",
        },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            lint.try_lint()
        end,
    })
end

return M


