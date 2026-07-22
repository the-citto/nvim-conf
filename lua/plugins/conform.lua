local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettier" },
			-- html = { "djlint" },
			javascript = { "prettier" },
			lua = { "stylua" },
			python = { "black", "ruff", "isort" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	})
	-- conform.formatters.djlint = { args = { "--reformat", "--format-css", "--format-js", "-" } }
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({
				bufnr = args.buf,
				timeout_ms = 2500,
				async = false,
			})
		end,
	})
end

return M
