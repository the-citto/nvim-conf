
local M = {
    'akinsho/toggleterm.nvim',
    version = '*',
    -- opts = {
    -- }
}

local python_id = 9
local node_id = 8

M.config = function()
    -- direction = 'horizontal',
    local toggleterm = require'toggleterm'
    toggleterm.setup {
        size = 15,
        open_mapping = [[<c-\>]],
        hide_number = true,
    }
    local Terminal = require('toggleterm.terminal').Terminal
    local python = Terminal:new({ 
        cmd = 'python', 
        count = python_id,
        hidden = true,
    })
    function _Python_Toggle()
        python:toggle()
    end
    local node = Terminal:new({ 
        cmd = 'node', 
        count = node_id,
        hidden = true,
    })
    function _Node_Toggle()
        node:toggle()
    end
end

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- vim.keymap.set('n', '<C-p>', '<cmd>ToggleTermSendCurrentLine ' .. python_id ..'<cr>', { desc = 'ToggleTermSendCurrentLine Python' })
-- vim.keymap.set('v', '<C-p>', ':ToggleTermSendVisualLines ' .. python_id .. '<cr>', { desc = 'ToggleTermSendCurrentLine Python' })
-- vim.keymap.set('v', '<C-p>', ':ToggleTermSendVisualSelection ' .. python_id .. '<cr>', { desc = 'ToggleTermSendCurrentLine Python' })


local function my_send_lines_to_terminal(selection_type, trim_spaces, cmd_data)
    local lazy = require('toggleterm.lazy')
    local utils = lazy.require("toggleterm.utils")
    local exec = require('toggleterm').exec
    local id = tonumber(cmd_data.args) or 1
    trim_spaces = trim_spaces == nil or trim_spaces
    vim.validate({
        selection_type = { selection_type, "string", true },
        trim_spaces = { trim_spaces, "boolean", true },
        terminal_id = { id, "number", true },
    })
    local current_window = vim.api.nvim_get_current_win() -- save current window
    local lines = {}
    -- Beginning of the selection: line number, column number
    local start_line, start_col
    if selection_type == "single_line" then
        start_line, start_col = unpack(vim.api.nvim_win_get_cursor(0))
        table.insert(lines, vim.fn.getline(start_line))
    else
        local res = nil
        if string.match(selection_type, "visual") then
            res = utils.get_line_selection("visual")
        else
            res = utils.get_line_selection("motion")
        end
        start_line, start_col = unpack(res.start_pos) 
        -- char, line and block are used for motion/operatorfunc. 'block' is ignored
        if selection_type == "visual_lines" or selection_type == "line" then
            lines = res.selected_lines
        elseif selection_type == "visual_selection" or selection_type == "char" then
            lines = utils.get_visual_selection(res, true)
        end
    end
    if not lines or not next(lines) then return end
    if not trim_spaces then
        exec(table.concat(lines, "\n"), id)
    else
        for _, line in ipairs(lines) do
            local l = trim_spaces and line:gsub("^%s+", ""):gsub("%s+$", "") or line
            exec(l, id)
        end
    end
    -- Jump back with the cursor where we were at the beginning of the selection
    vim.api.nvim_set_current_win(current_window)
    vim.api.nvim_win_set_cursor(current_window, { start_line, start_col })
end


local trim_spaces = false
vim.keymap.set('n', '<C-p>', function()
    -- require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = python_idt })
    my_send_lines_to_terminal('single_line', trim_spaces, { args = 9 })
end)
vim.keymap.set('v', '<C-p>', function()
    -- require('toggleterm').send_lines_to_terminal('visual_line', trim_spaces, { args = python_id })
    my_send_lines_to_terminal('visual_line', trim_spaces, { args = 9 })
end)
vim.keymap.set('v', '<C-p>', function()
    -- require('toggleterm').send_lines_to_terminal('visual_selection', trim_spaces, { args = python_id })
    my_send_lines_to_terminal('visual_selection', trim_spaces, { args = 9 })
end)


return M



