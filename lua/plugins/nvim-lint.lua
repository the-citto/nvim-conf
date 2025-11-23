

local M = {
    "mfussenegger/nvim-lint",
}

-- local mypy_path = "mypy"
-- local _, linux_path = next(vim.fs.find({"mypy"}, {type = "file", path = "./.venv/bin"}))
-- if linux_path ~= nil then
--     mypy_path = linux_path
--     -- mypy_path = vim.fn.getcwd() .. "/" .. linux_path
-- end
-- local _, win_path = next(vim.fs.find({"mypy.exe"}, {type = "file", path = "./.venv/Scripts"}))
-- if win_path ~= nil then
--     mypy_path = win_path
-- end


M.config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
        python = {
            "flake8",
            "mypy",
            -- "ruff",
        },
        -- terraform = {
        --     "terraform",
        -- },
    }
    -- lint.linters.mypy.cmd = mypy_path
    vim.api.nvim_create_autocmd(
        {"BufEnter", "BufWritePost", "InsertLeave"},
        {
            callback = function()
                lint.try_lint()
            end,
        }
    )
    vim.api.nvim_create_user_command("LintInfo", function()
        local filetype = vim.bo.filetype
        local linters = require("lint").linters_by_ft[filetype]

        if linters then
            print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
        else
            print("No linters configured for filetype: " .. filetype)
        end
    end, {})
end

return M


