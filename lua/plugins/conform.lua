local M = {
	"stevearc/conform.nvim",
}

local python_wsl_win_formatters = function()
	if vim.fn.getenv("IS_WSL_WIN") == "1" then
		return {}
	else
		return { "isort", "black", "ruff" }
	end
end

M.config = function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = {
				"stylua",
				-- "luaformatter",
			},
			python = python_wsl_win_formatters(),
			rust = { "rustfmt", lsp_format = "fallback" },
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
		end,
	})
	if vim.fn.getenv("IS_WSL_WIN") == "1" then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*.py",
			callback = function(args)
				vim.keymap.set(
					{ "v", "n" },
					"<leader>w",
					vim.cmd("write"),
					{ desc = "Format and save", buffer = args.buf }
				)
			end,
		})
	end
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	pattern = "*.py",
	-- 	callback = function(args)
	-- 		local file_path = vim.fn.expand("%")
	-- 		local ruff_cmd = { "pwsh.exe", "-Command", "uv run ruff check --fix --force-exclude " .. file_path }
	-- 		local ruff_res = vim.fn.system(ruff_cmd)
	-- 		local ruff_code = vim.v.shell_error
	-- 		if ruff_code ~= 0 then
	-- 			print("ruff exit code: " .. ruff_code)
	-- 			print(ruff_res)
	-- 		end
	-- 		local black_cmd = { "pwsh.exe", "-Command", "uv run black --quiet " .. file_path }
	-- 		local black_res = vim.fn.system(black_cmd)
	-- 		local black_code = vim.v.shell_error
	-- 		if black_code ~= 0 then
	-- 			print("black exit code: " .. black_code)
	-- 			print(black_res)
	-- 		end
	-- 		local isort_cmd = { "pwsh.exe", "-Command", "uv run isort " .. file_path }
	-- 		local isort_res = vim.fn.system(isort_cmd)
	-- 		local isort_code = vim.v.shell_error
	-- 		if isort_code ~= 0 then
	-- 			print("isort exit code: " .. isort_code)
	-- 			print(isort_res)
	-- 		end
	-- 	end,
	-- })
end

return M
