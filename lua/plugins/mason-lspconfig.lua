local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	opts = {
		-- automatic_installation = true
		ensure_installed = {
			"clangd",
			"cssls",
			"docker_compose_language_service",
			"dockerls",
			"gh_actions_ls",
			"golangci_lint_ls",
			"gopls",
			"html",
			"htmx",
			"jinja_lsp",
			"jsonls",
			"just",
			"lua_ls",
			"marksman",
			"pyright",
			"ruff",
			"rust_analyzer",
			"sqlls",
			"tailwindcss",
			"taplo",
			"terraformls",
			"tflint",
			"ts_ls",
			"ty",
			"yamlls",
		},
	},
}

return M
