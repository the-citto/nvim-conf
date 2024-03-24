
-- vim.g.REPL_iPython_pane_id = 2
-- vim.g.REPL_NodeJs_pane_id = 2
-- vim.api.nvim_create_user_command(
--     'REPLSetiPythonPaneId',
--     function (opts)
--         local pane_id = opts.fargs[1]
--         if tonumber(pane_id) < 2 then
--             return
--         end
--         vim.g.REPL_iPython_pane_id = pane_id
--     end,
--     {nargs = 1}
-- )
-- vim.api.nvim_create_user_command(
--     'REPLSetNodeJsPaneId',
--     function (opts)
--         local pane_id = opts.fargs[1]
--         if tonumber(pane_id) < 2 then
--             return
--         end
--         vim.g.REPL_NodeJs_pane_id = pane_id
--     end,
--     {nargs = 1}
-- )



local send_clean_code = function (pane_id, line)
    local send_keys_prefix = '!tmux send-keys -t ' .. pane_id ..  ' -l \''
    -- local send_keys_suffix = '\'\\; send-keys -t ' .. pane_id .. ' Enter'
    local send_keys_suffix = '\''
    line = line:gsub("'", "'\\''")
    line = line:gsub('!', '\\!')
    line = line:gsub('%%', '\\%%')
    line = line:gsub('#', '\\#')
    vim.cmd( send_keys_prefix .. line .. send_keys_suffix )
    vim.cmd('!tmux send-keys -t ' .. pane_id .. ' Enter')
end

local send_code = function (pane_id)
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
        send_clean_code(pane_id, line)
    else
        if mode == 'n' and vim.api.nvim_get_current_line() == "" then
            vim.cmd('!tmux send-keys -t ' .. pane_id .. ' Enter')
        else
            local indent_min = 100
            local indent_last
            local is_string = false
            local cnt
            for _, line in ipairs(vim.api.nvim_buf_get_lines(0, v_line - 1, c_line, false)) do
                cnt = select(2, string.gsub(line, "'''", ''))
                cnt = cnt + select(2, string.gsub(line, '"""', ''))
                if math.fmod(cnt, 2) == 1 then
                    is_string = not is_string
                end
                if is_string then
                    send_clean_code(pane_id, line)
                elseif line:gsub('^%s+', '') ~= '' then
                    _, indent_last = string.find(line, '^%s*')
                    indent_min = math.min(indent_min, indent_last)
                    send_clean_code(pane_id, line)
                end
            end
            -- if indent_last and indent_last > indent_min then 
            --     vim.cmd('!tmux send-keys -t ' .. pane_id .. ' Enter') 
            -- end
            if is_string then
                print('Incomplete multiline string sent to the terminal!')
            end
        end

    end
    -- vim.cmd('!tmux send-keys -t ' .. pane_id .. ' Enter') 
    vim.api.nvim_input('<esc>')
end


vim.keymap.set(
    { 'v', 'n' },
    '<C-Bslash>',
    function () send_code(2) end,
    { desc = 'Send code to REPL Pane 2' }
)
-- vim.keymap.set(
--     { 'v', 'n' },
--     '<C-i>',
--     function () send_code(3) end,
--     { desc = 'Send code to REPL Pane 3' }
-- )




