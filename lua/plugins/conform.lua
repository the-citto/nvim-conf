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
				-- "isort",
				-- "black",
				"ruff",
			},
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
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function(args)
			vim.keymap.set({ "v", "n" }, "<leader>w", function()
				local file_path = vim.fn.expand("%")
				vim.cmd("write")
				-- vim.fn.system({ "pwsh.exe", "-Command", "uv run black --quiet " .. file_path })
				-- vim.fn.system({ "pwsh.exe", "-Command", "uv run ruff check --fix --force-exclude " .. file_path })
				-- vim.fn.system({ "pwsh.exe", "-Command", "uv run isort " .. file_path })
				vim.fn.system({ "black", "--quiet", file_path })
				vim.fn.system({ "ruff", "check", "--fix", "--force-exclude", file_path })
				vim.fn.system({ "isort", file_path })
				vim.cmd("checktime")
			end, { desc = "Format and save", buffer = args.buf })
		end,
	})
end

return M
