local M = {
	"stevearc/conform.nvim",
}

M.config = function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			-- css = { "prettier" },
			-- html = { "djlint" },
			css = { "deno_fmt" },
			html = { "deno_fmt" },
			json = { "deno_fmt" },
			javascript = { "deno_fmt" },
			javascriptreact = { "deno_fmt" },
			lua = { "stylua" },
			python = { "black", "ruff", "isort" },
			rust = { "rustfmt" },
			typescript = { "deno_fmt" },
			typescriptreact = { "deno_fmt" },
			yaml = { "deno_fmt" },
		},
	})
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
