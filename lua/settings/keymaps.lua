

--- telescope
-- vim.keymap.set('n', '<leader>tff', require('telescope.builtin').find_files, {})
-- vim.keymap.set('n', '<leader>tlg', require('telescope.builtin').live_grep, {})
-- vim.keymap.set('n', '<leader>tgf', require('telescope.builtin').git_files, {})
-- vim.keymap.set('n', '<leader>tof', require('telescope.builtin').oldfiles, {})
--
-- -- undotree
-- vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, {})
--
-- -- fugitive
-- vim.keymap.set('n', '<leader>gs', vim.cmd.Git, {})
--


vim.keymap.set({ 'v', 'n' } , '<C-p>', 
    function ()
        local mode = vim.api.nvim_get_mode().mode
        local v_line = vim.fn.line('v')
        local curs = vim.api.nvim_win_get_cursor(0)
        local c_line = curs[1]
        if mode ~= 'n' and v_line == c_line then
            local s_col, e_col
            local v_col = vim.fn.col('v')
            local c_col = curs[2]
            if v_col < c_col then
                s_col, e_col = v_col-1, c_col+1
            else
                s_col, e_col = c_col, v_col
            end
            local line = vim.api.nvim_buf_get_text(0, v_line-1, s_col, c_line-1, e_col, {})[1]
            vim.cmd('!tmux send-keys -t 2 "' .. line:gsub('"', '\\"') .. '" Enter')
            vim.api.nvim_input('<esc>')
        else
            local indent_min = 100
            local indent_last
            for _, line in ipairs(vim.api.nvim_buf_get_lines(0, v_line - 1, c_line, false)) do
                if line:gsub('^%s+', '') ~= '' then 
                    _, indent_last = string.find(line, '^%s*')
                    indent_min = math.min(indent_min, indent_last)
                    vim.cmd('!tmux send-keys -t 2 "' .. line:gsub('"', '\\"') .. '" Enter')
                end
            end
            if indent_last > indent_min then vim.cmd('!tmux send-keys -t 2 Enter') end
            vim.api.nvim_input('<esc>')
        end
    end, { desc = 'Send to iPython (Pane 2)' }
)

