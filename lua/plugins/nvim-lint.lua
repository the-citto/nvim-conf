

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
    -- -- path/to/file:line:col: severity: message
    -- local pattern = '([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*) %[(%a[%a-]+)%]'
    -- local groups = { 'file', 'lnum', 'col', 'end_lnum', 'end_col', 'severity', 'message', 'code' }
    -- local severities = {
    --     error = vim.diagnostic.severity.ERROR,
    --     warning = vim.diagnostic.severity.WARN,
    --     note = vim.diagnostic.severity.HINT,
    -- }
    -- lint.linters.mypy = {
    --     cmd = 'mypy',
    --     stdin = false,
    --     stream = "both",
    --     ignore_exitcode = true,
    --     args = {
    --         '--show-column-numbers',
    --         '--show-error-end',
    --         '--hide-error-context',
    --         '--no-color-output',
    --         '--no-error-summary',
    --         '--no-pretty'
    --     },
    --     parser = require('lint.parser').from_pattern(
    --         pattern,
    --         groups,
    --         severities,
    --         { ['source'] = 'mypy' },
    --         { end_col_offset = 0 }
    --     ),
    --     -- cmd = ".venv/bin/mypy"
    -- }
    lint.linters.mypy.cmd = "/home/lexxx/.local/share/nvim/mason/packages/mypy/venv/bin/mypy"
    -- lint.linters.mypy.stdin = true
    -- lint.linters.mypy.args = {
    --     '--show-column-numbers',
    --     '--show-error-end',
    --     '--hide-error-context',
    --     '--no-color-output',
    --     '--no-error-summary',
    --     '--no-pretty',
    -- }
    lint.linters_by_ft = {
        -- javascript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
        -- lua = { "luacheck", },
        python = {"mypy"},
        -- typescript = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
    }
    -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd(
        {"BufEnter", "BufWritePost", "InsertLeave"},
        {
            -- group = lint_augroup,
            callback = function()
                lint.try_lint()
                -- lint.try_lint("mypy")
            end,
        }
    )
end

return M


