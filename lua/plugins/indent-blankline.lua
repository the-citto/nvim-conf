
local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
}

M.config = function ()
    local ibl = require"ibl"
    ibl.setup {
        indent = {
            char = "▏"
        },
        scope = {
            enabled = false,
        },
    }
end



return M

