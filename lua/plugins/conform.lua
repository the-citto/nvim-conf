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
			pattern = "python",
			callback = function(args)
				vim.keymap.set({ "v", "n" }, "<leader>w", function()
					local file_path = vim.fn.expand("%")
					vim.cmd("write")
					vim.fn.system({ "pwsh.exe", "-Command", "uv run black --quiet " .. file_path })
					vim.fn.system({ "pwsh.exe", "-Command", "uv run ruff check --fix --force-exclude " .. file_path })
					vim.fn.system({ "pwsh.exe", "-Command", "uv run isort " .. file_path })
					vim.cmd("checktime")
				end, { desc = "Format and save", buffer = args.buf })
			end,
		})
	end
end

return M
