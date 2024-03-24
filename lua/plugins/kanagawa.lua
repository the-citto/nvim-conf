
local M = {
    "rebelot/kanagawa.nvim",
    lazy = false,
}

M.config = function ()
    local kanagawa = require"kanagawa"
    kanagawa.setup{
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = { italic = false },
        keywordStyle = { italic = false },
        statementStyle = { italic = false },
        typeStyle = { italic = false },
        overrides = function()
            return {
                ["@variable.builtin"] = { italic = false },
            }
        end,
        transparent = true,         -- do not set background color
        -- dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        -- terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        -- add/modify theme and palette colors
        colors = {
            -- palette = {},
            theme = {
                wave = {}, lotus = {}, dragon = {},
                all = {
                    ui = {
                        bg_gutter = "none",
                        -- bg_m3      = "#000000",
                        -- bg_m2      = "#000000",
                        -- bg_m1      = "#000000",
                        -- bg         = "#000000",
                        -- bg_p1      = "#000000",
                        bg_p2      = "#0d0c0c",
                    },
                },
            },
        },
        -- add/modify highlights
        -- overrides = function(colors) 
        --     local theme = colors.theme
        --     return {}
        -- end,
        -- theme = "wave",              -- Load "wave" theme when "background" option is not set
        -- -- map the value of "background" option to a theme
        -- background = {               
        --     dark = "dragon",           -- try "dragon" !
        --     light = "lotus"
        -- },
    }
    kanagawa.load("dragon")
end

return M


