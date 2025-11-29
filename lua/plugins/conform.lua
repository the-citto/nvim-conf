local M = {
	"stevearc/conform.nvim",
}

-- local wsl_win_formatters = function(args)
-- 	vim.fn.system("command -v pwsh.exe")
-- 	if vim.v.shell_error ~= 0 then
-- 		print("'pwsh.exe' not found.")
-- 		return nil
-- 	end
-- 	vim.fn.system("command -v uv.exe")
-- 	if vim.v.shell_error ~= 0 then
-- 		print("'uv.exe' not found.")
-- 		return nil
-- 	end
-- 	local abs_path = args.file
-- 	local relative_path = vim.fn.fnamemodify(abs_path, ":.")
-- 	print(relative_path)
-- 	print(relative_path)
-- 	print(relative_path)
-- 	local pwsh_cmd = 'pwsh.exe -Command "uv run '
-- 	local ruff_cmd = "ruff check --fix "
-- 	local ruff_check = vim.fn.system(pwsh_cmd .. ruff_cmd .. relative_path .. '"')
-- 	-- local ruff_check = vim.fn.system(pwsh_cmd .. 'ls"')
-- 	-- print(ruff_check)
-- 	if vim.v.shell_error ~= 0 then
-- 		print(ruff_check)
-- 	end
-- 	-- ~/.local/share/nvim/mason/bin/ruff check --fix src/programming_bitcoin/ecc.py
-- 	-- local pwsh = "pwsh.exe -Command "
-- 	-- local uv_ruff = vim.fn.system(pwsh .. "")
-- 	-- require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
-- 	-- local _, linux_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/lib" }))
-- 	-- local _, win_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/Lib" }))
-- 	--
-- 	-- if linux_py_libs ~= nil then
-- 	-- 	vim.fn.setenv("PYTHONPATH", linux_py_libs)
-- 	-- elseif win_py_libs ~= nil then
-- 	-- 	vim.fn.setenv("PYTHONPATH", win_py_libs)
-- 	-- end
-- 	--
-- 	-- if vim.fn.getcwd():match("/([^/]+)") == "mnt" then
-- 	-- 	vim.fn.setenv("IS_WSL_WIN", "1")
-- 	-- end
-- end

M.config = function()
	local conform = require("conform")
	conform.setup({
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
	if vim.fn.getenv("IS_WSL_WIN") == "1" then
		conform.formatters.ruff = {
			-- inherit = false,
			command = "pwsh.exe",
			args = {
				"-Command",
				'"uv run ruff check --fix --force-exclude --exit-zero --no-cache --stdin-filename $FILENAME -"',
			},
		}
		conform.formatters.black = {
			-- inherit = false,
			command = "pwsh.exe",
			args = {
				"-Command",
				'"--stdin-filename $FILENAME --quiet -"',
			},
		}
		conform.formatters.isort = {
			-- inherit = false,
			command = "",
			args = {
				"",
			},
		}
	end
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
		end,
	})
end

return M
