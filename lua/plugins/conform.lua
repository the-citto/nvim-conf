local M = {
	"stevearc/conform.nvim",
}

local python_wsl_win_formatters = function()
	if vim.fn.getenv("IS_WSL_WIN") == "1" then
		return {
			isort = {
				command = 'pwsh.exe -Command "uv run isort --line-ending lf $FILENAME"',
				-- args = {
				-- 	"-Command",
				-- 	"uv run isort --stdout --line-ending lf --filename $FILENAME -",
				-- },
			},
			black = {
				command = 'pwsh.exe -Command "uv run black --quiet $FILENAME"',
				-- 	args = {
				-- 		"-Command",
				-- 		"uv run black --stdin-filename $FILENAME --quiet -",
				-- 	},
			},
			ruff = {
				command = 'pwsh.exe -Command "uv run ruff check --fix --force-exclude --exit-zero --no-cache $FILENAME"',
				-- args = {
				-- 	"-Command",
				-- 	"uv run ruff check --fix --force-exclude --exit-zero --no-cache --stdin-filename $FILENAME -",
				-- },
			},
		}
	else
		return {}
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
			python = { "isort", "black", "ruff" },
			rust = { "rustfmt", lsp_format = "fallback" },
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		formatters = python_wsl_win_formatters(),
	})
	-- if vim.fn.getenv("IS_WSL_WIN") == "1" then
	-- 	conform.formatters.ruff = {
	-- 		-- inherit = false,
	-- 		command = "pwsh.exe",
	-- 		args = {
	-- 			"-Command",
	-- 			"uv run ruff check --fix --force-exclude --exit-zero --no-cache --stdin-filename $FILENAME -",
	-- 		},
	-- 	}
	-- 	conform.formatters.black = {
	-- 		-- inherit = false,
	-- 		command = "pwsh.exe",
	-- 		args = {
	-- 			"-Command",
	-- 			"uv run black --stdin-filename $FILENAME --quiet -",
	-- 		},
	-- 	}
	-- 	conform.formatters.isort = {
	-- 		-- inherit = false,
	-- 		command = "",
	-- 		args = {
	-- 			"",
	-- 		},
	-- 	}
	-- end
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf, timeout_ms = 500 })
		end,
	})
end

return M
