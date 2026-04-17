local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"black",
			"clang-format",
			"isort",
			"stylua",
		},
	})
end

return M
