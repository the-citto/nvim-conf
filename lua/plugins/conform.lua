local M = {
	"stevearc/conform.nvim",
}

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
				"uv run ruff check --fix --force-exclude --exit-zero --no-cache --stdin-filename $FILENAME -",
			},
		}
		conform.formatters.black = {
			-- inherit = false,
			command = "pwsh.exe",
			args = {
				"-Command",
				"uv run black --stdin-filename $FILENAME --quiet -",
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
