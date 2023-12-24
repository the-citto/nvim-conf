
local M = {
    'akinsho/toggleterm.nvim',
    version = "*",
    -- opts = {
    -- }
}

M.config = function()
    -- direction = 'horizontal',
    local toggleterm = require'toggleterm'
    toggleterm.setup {
        size = 15,
        open_mapping = [[<c-\>]],
        hide_number = true,
    }
    local Terminal = require('toggleterm.terminal').Terminal
    local python = Terminal:new({ cmd = 'python', hidden = true })
    function _Python_Toggle()
        python:toggle()
    end
    local node = Terminal:new({ cmd = 'node', hidden = true })
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

-- vim.keymap.set('n', '<C-e>', '<cmd>ToggleTermSendCurrentLine<cr>', {})
-- vim.keymap.set('v', '<C-e>', ':ToggleTermSendVisualLines<cr>', {})
-- vim.keymap.set('v', '<C-e>', ':ToggleTermSendVisualSelection<cr>', {})

local trim_spaces = false
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
vim.keymap.set("v", "<space>s", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
   -- require("toggleterm").send_lines_to_terminal("visual_line", trim_spaces, { args = vim.v.count })
    -- require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })





return M



