
local M = {
    'lukas-reineke/indent-blankline.nvim', 
    main = 'ibl', 
    -- opts = {}
}

M.config = function ()
    local ibl = require'ibl'
    ibl.setup {
        indent = {
            -- highlight = { 'LineNr' }, 
            -- char = '|' 
        },
        scope = {
            enabled = false,
            -- show_start = false,
            -- show_end = false,
        },
    } 
end



return M

