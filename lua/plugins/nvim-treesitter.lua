local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
}

M.config = function()
	local treesitter = require("nvim-treesitter")
	treesitter.install({
		"bash",
		"css",
		"html",
		"javascript",
		"json",
		"jsx",
		"just",
		"lua",
		"python",
		"rust",
		"terraform",
		"tsx",
		"typescript",
		"yaml",
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "*" },
		callback = function(args)
			local buf = args.buf
			local ft = vim.bo[buf].filetype
			local _, parser_table = pcall(vim.treesitter.get_parser, buf, ft)
			if parser_table == nil then
				if ft ~= "NvimTree" then
					vim.notify(
						"Treesitter parser missing for: " .. ft .. " (Falling back to legacy syntax)",
						vim.log.levels.WARN,
						{ title = "Treesitter Check" }
					)
				end
			else
				if vim.treesitter.query.get(ft, "highlights") then
					vim.treesitter.start()
				end
				if vim.treesitter.query.get(ft, "indents") then
					vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
				end
			end
		end,
	})
end

return M

-- -- dependencies = {
-- -- 	{
-- -- 		"nvim-treesitter/nvim-treesitter-textobjects",
-- -- 		branch = "main",
-- -- 	},
-- -- 	-- {
-- -- 	-- 	"windwp/nvim-ts-autotag",
-- -- 	-- 	opt_locals = {},
-- -- 	-- },
-- -- },
-- config = function()
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = { "*" },
-- 		callback = function(args)
-- 			local buf = args.buf
-- 			local ft = vim.bo[buf].filetype
-- 			local buftype = vim.bo[buf].buftype
-- 			if buftype == "nofile" or buftype == "prompt" or buftype == "quickfix" then
-- 				return
-- 			end
-- 			local indent = 4
-- 			local expandtab = true
-- 			local two_space_fts = {
-- 				css = true,
-- 				html = true,
-- 				javascript = true,
-- 				javascriptreact = true,
-- 				r = true,
-- 				terraform = true,
-- 				typescript = true,
-- 				typescriptreact = true,
-- 				yaml = true,
-- 			}
-- 			-- if ft == "r" or ft == "yaml" or ft == "terraform" then
-- 			if two_space_fts[ft] then
-- 				indent = 2
-- 			elseif ft == "make" then
-- 				indent = 8
-- 				expandtab = false
-- 			end
-- 			vim.opt_local.tabstop = indent
-- 			vim.opt_local.expandtab = expandtab
-- 			vim.opt_local.softtabstop = indent
-- 			vim.opt_local.shiftwidth = indent
-- 			-- vim.opt_local.foldmethod = "indent"
-- 			-- vim.opt_local.foldcolumn = "4"
-- 			-- vim.opt_local.foldlevel = 4
-- 			-- vim.opt_local.foldlevelstart = 2
-- 			-- vim.opt_local.foldnestmax = 4
-- 			-- local has_parser = pcall(vim.treesitter.get_parser, buf)
-- 			-- if has_parser then
-- 			-- 	vim.treesitter.start(args.buf)
-- 			-- 	vim.bo[args.buf].syntax = "off"
-- 			-- 	vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 			-- elseif ft ~= "" then
-- 			-- 	vim.notify(
-- 			-- 		"Treesitter parser missing for: " .. ft .. " (Falling back to legacy syntax)",
-- 			-- 		vim.log.levels.WARN,
-- 			-- 		{ title = "Treesitter Check" }
-- 			-- 	)
-- 			-- end
-- 		end,
-- 	})
-- end,
