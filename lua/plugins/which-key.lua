local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}

M.config = function()
	require("which-key").add({
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = ":Telescope buffers" },
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = ":Telescope find_files" },
		{ "<leader>s", group = "Telescope", mode = { "n", "v" } },
		{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = ":Telescope commands" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = ":Telescope find_files" },
		{
			"<leader>sh",
			function()
				require("telescope.builtin").live_grep({
					prompt_title = "Live Grep (All Files)",
					additional_args = function()
						return { "--hidden", "--no-ignore" }
					end,
				})
			end,
			desc = "Telescope live grep (all files)",
		},
		{
			"<leader>sh",
			function()
				vim.cmd("normal! \27")
				local s = vim.fn.getpos("'<")
				local e = vim.fn.getpos("'>")
				if s[2] ~= e[2] then
					vim.api.nvim_echo({ { "Command invalid for multiline selection." } }, true, {})
					return
				end
				local lines = vim.fn.getregion(s, e, { type = vim.fn.visualmode() })
				local selected_text = lines[1] or ""
				require("telescope.builtin").live_grep({
					prompt_title = "Live Grep (All Files)",
					default_text = selected_text,
					additional_args = function()
						return { "--hidden", "--no-ignore" }
					end,
				})
			end,
			desc = "Telescope live grep (all files)",
			mode = "v",
		},

		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = ":Telescope keymaps" },
		{
			"<leader>sl",
			"<cmd>Telescope live_grep<cr>",
			desc = ":Telescope live_grep",
		},
		{
			"<leader>sl",
			function()
				vim.cmd("normal! \27")
				local s = vim.fn.getpos("'<")
				local e = vim.fn.getpos("'>")
				if s[2] ~= e[2] then
					vim.api.nvim_echo({ { "Command invalid for multiline selection." } }, true, {})
					return
				end
				local lines = vim.fn.getregion(s, e, { type = vim.fn.visualmode() })
				local selected_text = lines[1] or ""
				require("telescope.builtin").live_grep({
					prompt_title = "Live Grep (All Files)",
					default_text = selected_text,
				})
			end,
			desc = "Telescope live grep (all files)",
			mode = "v",
		},
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = ":Telescope marks" },
		{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = ":Telescope oldfiles" },
		{ "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = ":Telescope quickfix" },
		{ "<leader>sg", group = "Telescope Git" },
		{ "<leader>sgb", "<cmd>Telescope git_branches<cr>", desc = ":Telescope git_branches" },
		{ "<leader>sgc", "<cmd>Telescope git_commit<cr>", desc = ":Telescope git_commit" },
		{ "<leader>sgf", "<cmd>Telescope git_files<cr>", desc = ":Telescope git_files" },
		{ "<leader>sgs", "<cmd>Telescope git_status<cr>", desc = ":Telescope git_status" },
		{ "<leader>t", group = "Trouble" },
		{ "<leader>tf", "<cmd>Trouble diagnostics focus<cr>", desc = ":Trouble diagnostics focus" },
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = ":Trouble diagnostics toggle" },
		{ "<leader>tc", "<cmd>lua vim.diagnostic.reset()<cr>", desc = ":diagnostics reset" },
	})
end

return M
