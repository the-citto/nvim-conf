

local M = {
    "mfussenegger/nvim-lint",
}

local mypy_path = "mypy"
local _, linux_path = next(vim.fs.find({"mypy"}, {type = "file"}))
if linux_path ~= nil then
    mypy_path = linux_path
end
local _, win_path = next(vim.fs.find({"mypy.exe"}, {type = "file"}))
if win_path ~= nil then
    mypy_path = win_path
end


M.config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
        python = {"mypy"},
    }
    lint.linters.mypy.cmd = mypy_path
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


