local ignored_ft = {
	"NvimTree",
	"TelescopePrompt",
	"dashboard",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
}

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
		},
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"c_sharp",
			"cmake",
			"cpp",
			"css",
			"csv",
			"dockerfile",
			"fortran",
			"gitignore",
			"go",
			"html",
			"htmldjango",
			"jinja",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"make",
			"markdown",
			"powershell",
			"python",
			"query",
			"r",
			"regex",
			"rust",
			"scss",
			"sql",
			"terraform",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"xml",
			"yaml",
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "*" },
			callback = function(args)
				local indent = 4
				local expandtab = true
				local ft = vim.bo[args.buf].filetype
				for _, name in ipairs(ignored_ft) do
					if ft == name then
						return
					end
				end
				if ft == "r" or ft == "yaml" or ft == "terraform" then
					indent = 2
				elseif ft == "make" then
					indent = 8
					expandtab = false
					-- elseif ft == "python" or ft == "lua" then
					--     vim.opt.foldmethod = "indent"
					--     vim.opt.foldcolumn = "4"
					--     vim.opt.foldlevel = 4
					--     vim.opt.foldlevelstart = 2
					--     vim.opt.foldnestmax = 4
				end
				vim.opt.tabstop = indent
				vim.opt.expandtab = expandtab
				vim.opt.softtabstop = indent
				vim.opt.shiftwidth = indent
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang then
					vim.treesitter.start(args.buf)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				else
					print("No Treesitter parser for: " .. vim.bo[args.buf].filetype)
				end
			end,
		})
	end,
}

return M
