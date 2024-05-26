

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
        -- l = {
        --     name = "Lsp",
        -- },
        -- g = {
        --     name = "Git",
        --     -- f = { "<cmd>Git<cr>", ":Git (fugitive git status)" },
        --     s = {
        --         name = "GitSigns",
        --         b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", ":GitSigns toggle_current_line_blame" },
        --     },
        -- },
        t = {
            name = "Trouble",
            c = { "<cmd>TroubleClose<cr>", ":TroubleClose", },
            o = { "<cmd>Trouble<cr>", ":Trouble", },
            r = { "<cmd>TroubleRefresh<cr>", ":TroubleRefresh", },
            t = { "<cmd>TroubleToggle<cr>", ":TroubleToggle", },
        },
        -- u = {
        --     name = "Undotree",
        --     t = { "<cmd>UndotreeToggle<cr>", ":UndotreeToggle" },
        -- },
    },
}

M.config = function()
    require("which-key").register(mappings, opts)
end


return M


