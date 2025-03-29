
local M = {
    "rebelot/kanagawa.nvim",
    lazy = false,
}

M.config = function ()
    local kanagawa = require"kanagawa"
    kanagawa.setup{
        compile = false,
        undercurl = true,
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
        transparent = true,
        colors = {
            theme = {
                wave = {},
                lotus = {},
                dragon = {},
                all = {
                    ui = {
                        bg_gutter = "none",
                        bg_p2 = "#0d0c0c",
                    },
                },
            },
        },
    }
    kanagawa.load("dragon")
end

return M


