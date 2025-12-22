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
				local has_parser = pcall(vim.treesitter.get_parser, args.buf)
				if has_parser then
					vim.treesitter.start(args.buf)
					vim.bo[args.buf].syntax = "off"
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				else
					vim.bo[args.buf].syntax = "on"
					vim.notify(
						"Treesitter parser missing for: " .. ft .. " (Falling back to legacy syntax)",
						vim.log.levels.WARN,
						{ title = "Treesitter Check" }
					)
				end
			end,
		})
	end,
}

return M
