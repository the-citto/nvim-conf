local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"isort",
			"black",
			"stylua",
		},
	})
end

return M
