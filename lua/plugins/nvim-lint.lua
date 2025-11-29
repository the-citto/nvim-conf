

local M = {
    "mfussenegger/nvim-lint",
}

local python_linters = function ()
    local all = {
            "flake8",
                "mypy",
    }
             if vim.fn.getcwd():match( "/([^/]+)") == "mnt" then
                for idx, name in ipairs(all) do
                    if name == "mypy" then
                        table.remove(all, idx)
                    end
                end
            end
            return all
end

M.config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
        python = python_linters()
        -- python = function ()
        --     local py_linters = {
        --         "flake8",
        --         "mypy",
        --     }
        --     if vim.fn.getcwd():match( "/([^/]+)") == "mnt" then
        --         for idx, name in ipairs(py_linters) do
        --             if name == "mypy" then
        --                 table.remove(py_linters, idx)
        --             end
        --         end
        --     end
        --     return py_linters
        -- end
        -- terraform = {
        --     "terraform",
        -- },
    }
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


