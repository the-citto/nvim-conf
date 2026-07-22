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
			"denols",
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
			"neocmake",
			"pyright",
			"ruff",
			"rust_analyzer",
			"tailwindcss",
			"taplo",
			"terraformls",
			"tflint",
			"ts_ls",
			"ty",
			"vue_ls",
			"yamlls",
		},
	},
}

return M
