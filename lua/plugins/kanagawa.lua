
local M = {
    'rebelot/kanagawa.nvim',
    lazy = false,
    opts = {
        -- compile = false,             -- enable compiling the colorscheme
        -- undercurl = true,            -- enable undercurls
        commentStyle = { italic = false },
        -- functionStyle = {},
        keywordStyle = { italic = false},
        -- statementStyle = { bold = true },
        -- typeStyle = {},
        transparent = true,         -- do not set background color
        -- dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        -- terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        -- add/modify theme and palette colors
        -- colors = {                   
        --     palette = {},
        --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        -- },
        -- add/modify highlights
        -- overrides = function(colors) 
        --     return {}
        -- end,
        -- theme = 'wave',              -- Load 'wave' theme when 'background' option is not set
        -- -- map the value of 'background' option to a theme
        -- background = {               
        --     dark = 'dragon',           -- try 'dragon' !
        --     light = 'lotus'
        -- },
    },
}  

return M 


