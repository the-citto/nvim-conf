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
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.py",
		callback = function(args)
			print(args.buf)
			print(args.buf)
			print(args.buf)
		end,
	})
end

return M
