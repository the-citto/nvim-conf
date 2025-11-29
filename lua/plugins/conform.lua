local M = {
	"stevearc/conform.nvim",
}

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
		format_on_save = { timeout_ms = 500 },
	})
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			if vim.fn.getenv("IS_WSL_WIN") == nil then
				require("conform").format({ bufnr = args.buf })
			end
		end,
	})
end

return M
