

local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    -- opts = {}
}


local opts = {}

local mappings = {
    ["<leader>"] = {
        b = {
            '<cmd>lua require"telescope.builtin".buffers(require"telescope.themes".get_dropdown{previewer=false})<cr>',
            "Buffers",
        },
        f = {
            name = "Telescope",
            f = { "<cmd>Telescope find_files<cr>", ":Telescope find_files", },
            g = { "<cmd>Telescope git_files<cr>", ":Telescope git_files", },
            l = { "<cmd>Telescope live_grep<cr>", ":Telescope live_grep", },
            o = { "<cmd>Telescope oldfiles<cr>", ":Telescope oldfiles", },
            -- s = { "<cmd>Telescope software-licenses find<cr>", ":Telescope software-licenses find", },
        },
        t = {
            name = "Trouble",
            -- c = { "<cmd>TroubleClose<cr>", ":TroubleClose", },
            -- o = { "<cmd>Trouble<cr>", ":Trouble", },
            -- r = { "<cmd>TroubleRefresh<cr>", ":TroubleRefresh", },
            f = { "<cmd>Trouble diagnostics focus<cr>", ":Trouble diagnostics focus", },
            t = { "<cmd>Trouble diagnostics toggle<cr>", ":Trouble diagnostics toggle", },
        },
    },
}

M.config = function()
    require("which-key").register(mappings, opts)
end


return M


