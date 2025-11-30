local M = {
	"mfussenegger/nvim-lint",
}

-- local python_linters = function()
-- 	local all = {
-- 		"flake8",
-- 		"mypy",
-- 	}
-- 	-- if vim.fn.getcwd():match( "/([^/]+)") == "mnt" then
-- 	if vim.fn.getenv("IS_WSL_WIN") == "1" then
-- 		for idx, name in ipairs(all) do
-- 			if name == "mypy" then
-- 				table.remove(all, idx)
-- 			end
-- 		end
-- 	end
-- 	return all
-- end

M.config = function()
	local lint = require("lint")
	lint.linters_by_ft = {
		-- python = python_linters(),
		-- lua `{}` is truthy
		python = vim.fn.getenv("IS_WSL_WIN") == "1" and { "flake8" } or { "flake8", "mypy" },
		-- terraform = {
		--     "terraform",
		-- },
	}
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "FileChangedShell" }, {
		callback = function()
			lint.try_lint()
		end,
	})
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
