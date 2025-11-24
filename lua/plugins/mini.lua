
local M = {
    "nvim-mini/mini.nvim",
    version = false,
}

M.config = function()
    -- require("mini.pairs").setup()
    -- require("mini.extra").setup()
    require("mini.comment").setup({
        mappings = {
            comment_line = '<C-_>',
            comment_visual = '<C-_>',
        },
    })
    require("mini.indentscope").setup({
        draw = {
            delay = 10,
        },
        symbol = "▏",
        options = {
            border = "top",
            indent_at_cursor = false,
        },
    })
    require('mini.diff').setup()
    -- require('mini.git').setup()
end

return M

