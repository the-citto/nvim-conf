
local M = {
    "m4xshen/hardtime.nvim",
    command = "Hardtime",
    event = "BufEnter",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        -- enabled = false,
        restriction_mode = "hint",
        disabled_keys = {
            ["<Up>"] = { },
            ["<Down>"] = { },
            ["<Left>"] = { },
            ["<Right>"] = { },
        },
    },
}


return M

