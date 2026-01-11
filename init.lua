local _, linux_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/lib" }))
local _, win_py_libs = next(vim.fs.find("site-packages", { type = "directory", path = ".venv/Lib" }))

if linux_py_libs ~= nil then
	vim.fn.setenv("PYTHONPATH", linux_py_libs)
elseif win_py_libs ~= nil then
	vim.fn.setenv("PYTHONPATH", win_py_libs)
end

-- if vim.fn.getcwd():match("/([^/]+)") == "mnt" then
-- 	vim.fn.setenv("IS_WSL_WIN", "1")
-- end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.filetype.add({
	pattern = {
		["requirements.*.*"] = "requirements",
		[".gcloudignore"] = "gitignore",
		[".coveragerc"] = "dosini",
		[".flake8"] = "dosini",
	},
})

vim.keymap.set({ "n", "v", "i" }, "<c-z>", "<esc>u", { remap = true, desc = "undo" })

vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver50,r-cr-o:hor20,a:blinkwait250-blinkoff500-blinkon500"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.wrap = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
	print("Lazy not present - git cloning")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local send_clean_code = function(pane_id, line)
	local send_keys_prefix = "!tmux send-keys -t " .. pane_id .. " -l '"
	local send_keys_suffix = "'"
	line = line:gsub("'", "'\\''")
	line = line:gsub("!", "\\!")
	line = line:gsub("%%", "\\%%")
	line = line:gsub("#", "\\#")
	line = line:gsub(";$", ";;")
	vim.cmd(send_keys_prefix .. line .. send_keys_suffix)
	vim.cmd("!tmux send-keys -t " .. pane_id .. " Enter")
end
local send_code = function(pane_id)
	local mode = vim.api.nvim_get_mode().mode
	local v_line = vim.fn.line("v")
	local curs = vim.api.nvim_win_get_cursor(0)
	local c_line = curs[1]
	if mode ~= "n" and v_line == c_line then
		local s_col, e_col
		local v_col = vim.fn.col("v")
		local c_col = curs[2]
		if v_col < c_col then
			s_col, e_col = v_col - 1, c_col + 1
		else
			s_col, e_col = c_col, v_col
		end
		local line = vim.api.nvim_buf_get_text(0, v_line - 1, s_col, c_line - 1, e_col, {})[1]
		send_clean_code(pane_id, line)
	else
		if mode == "n" and vim.api.nvim_get_current_line() == "" then
			vim.cmd("!tmux send-keys -t " .. pane_id .. " Enter")
		else
			local indent_min = 100
			local indent_last
			local is_string = false
			local cnt
			for _, line in ipairs(vim.api.nvim_buf_get_lines(0, v_line - 1, c_line, false)) do
				cnt = select(2, string.gsub(line, "'''", ""))
				cnt = cnt + select(2, string.gsub(line, '"""', ""))
				if math.fmod(cnt, 2) == 1 then
					is_string = not is_string
				end
				if is_string then
					send_clean_code(pane_id, line)
				elseif line:gsub("^%s+", "") ~= "" then
					_, indent_last = string.find(line, "^%s*")
					indent_min = math.min(indent_min, indent_last)
					send_clean_code(pane_id, line)
				end
			end
			if is_string then
				print("Incomplete multiline string sent to the terminal!")
			end
		end
	end
	vim.api.nvim_input("<esc>")
end

vim.keymap.set({ "v", "n" }, "<C-Bslash>", function()
	send_code(2)
end, { desc = "Send code to REPL Pane 2" })

-- vim.keymap.set(
--     { 'v', 'n' },
--     '<C-i>',
--     function () send_code(3) end,
--     { desc = 'Send code to REPL Pane 3' }
-- )

-- auto install of pynvim
-- require("startup.pynvim_env")
-- vim.g.python_host_prog = "/usr/bin/python"
-- vim.g.python3_host_prog = "/usr/bin/python3"

-- lazy
-- require("startup.lazy")

-- require("startup")

-- require("settings")

-- require("utils")
