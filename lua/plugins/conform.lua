local M = {
	"stevearc/conform.nvim",
}

local wsl_win_formatters = function(args)
	-- vim.fn.system("command -v pwsh.exe")
	-- if vim.v.shell_error ~= 0 then
	-- 	print("'pwsh.exe' not found.")
	-- 	return nil
	-- end
	-- vim.fn.system("command -v uv.exe")
	-- if vim.v.shell_error ~= 0 then
	-- 	print("'uv.exe' not found.")
	-- 	return nil
	-- end
	local file_path = vim.api.nvim_buf_get_name(args.buf):gsub("/mnt/c", "C:")
	local pwsh_cmd = 'pwsh.exe -Command "uv run '
	local ruff_cmd = "ruff check --fix "
	-- local ruff_check = vim.fn.system(pwsh_cmd .. ruff_cmd .. file_path .. '"')
	local ruff_check = vim.fn.system(pwsh_cmd .. 'ls"')
	print(ruff_check)
	if vim.v.shell_error ~= 0 then
		print(ruff_check)
	end
	-- ~/.local/share/nvim/mason/bin/ruff check --fix src/programming_bitcoin/ecc.py
	-- local pwsh = "pwsh.exe -Command "
	-- local uv_ruff = vim.fn.system(pwsh .. "")
	-- require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
	-- local _, linux_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/lib" }))
	-- local _, win_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/Lib" }))
	--
	-- if linux_py_libs ~= nil then
	-- 	vim.fn.setenv("PYTHONPATH", linux_py_libs)
	-- elseif win_py_libs ~= nil then
	-- 	vim.fn.setenv("PYTHONPATH", win_py_libs)
	-- end
	--
	-- if vim.fn.getcwd():match("/([^/]+)") == "mnt" then
	-- 	vim.fn.setenv("IS_WSL_WIN", "1")
	-- end
end

M.config = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = {
				"stylua",
				-- "luaformatter",
			},
			python = {
				"isort",
				"black",
				"ruff",
			},
			rust = { "rustfmt", lsp_format = "fallback" },
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			local ft = vim.bo[args.buf].filetype
			if ft == "python" and vim.fn.getenv("IS_WSL_WIN") == "1" then
				wsl_win_formatters(args)
				-- local error = wsl_win_formatters(args)
				-- if error ~= nil then
				-- 	vim.notify(error, vim.log.levels.WARN)
				-- end
			else
				-- local error = wsl_win_formatters(args)
				wsl_win_formatters(args)
				-- if error ~= nil then
				-- 	vim.notify(error, vim.log.levels.WARN)
				-- end
				-- require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
			end
			-- 	if vim.fn.getenv("IS_WSL_WIN") == "1" then
			-- 		local cmd_out = vim.fn.system("echo foo")
			-- 		vim.notify(cmd_out)
			-- 	else
			-- 		local cmd_out = vim.fn.system("")
			-- 		vim.notify(cmd_out)
			-- 		require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
			-- 	end
		end,
	})
end

return M
