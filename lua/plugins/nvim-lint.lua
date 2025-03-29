

local M = {
    "mfussenegger/nvim-lint",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

M.config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
        python = {"mypy"},
    }
    vim.api.nvim_create_autocmd(
        {"BufEnter", "BufWritePost", "InsertLeave"},
        {
            callback = function()
                lint.try_lint()
            end,
        }
    )
end

return M


