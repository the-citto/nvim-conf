

local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}


local opts = {}

local mappings = {
    ["<leader>"] = {
        b = { "<cmd>Telescope buffers<cr>", ":Telescope buffers", },
        -- b = {
        --     '<cmd>lua require"telescope.builtin".buffers(require"telescope.themes".get_dropdown{previewer=false})<cr>',
        --     "Buffers",
        -- },
        h = { "<cmd>Hardtime toggle<cr>", ":Hardtime toggle" },
        f = { "<cmd>Telescope find_files<cr>", ":Telescope find_files", },
        q = {
            name = "quickfix",
            c = { "<cmd>cclose<cr>", ":cclose", },
            o = { "<cmd>copen<cr>", ":copen", },
            r = { "<cmd>call setqflist([])<cr><cmd>cclose<cr>", "reset quickfix list", },
        },
        s = {
            name = "Telescope",
            c = { "<cmd>Telescope commands<cr>", ":Telescope commands", },
            f = { "<cmd>Telescope find_files<cr>", ":Telescope find_files", },
            g = {
                name = "git",
                b = { "<cmd>Telescope git_branches<cr>", ":Telescope git_branches", },
                c = { "<cmd>Telescope git_commit<cr>", ":Telescope git_commit", },
                f = { "<cmd>Telescope git_files<cr>", ":Telescope git_files", },
                s = { "<cmd>Telescope git_status<cr>", ":Telescope git_status", },
            },
            k = { "<cmd>Telescope keymaps<cr>", ":Telescope keymaps", },
            l = { "<cmd>Telescope live_grep<cr>", ":Telescope live_grep", },
            m = { "<cmd>Telescope marks<cr>", ":Telescope marks", },
            o = { "<cmd>Telescope oldfiles<cr>", ":Telescope oldfiles", },
            q = { "<cmd>Telescope quickfix<cr>", ":Telescope quickfix", },
        },
        t = {
            name = "Trouble",
            f = { "<cmd>Trouble diagnostics focus<cr>", ":Trouble diagnostics focus", },
            t = { "<cmd>Trouble diagnostics toggle<cr>", ":Trouble diagnostics toggle", },
        },
    },
}


M.config = function()
    require("which-key").register(mappings, opts)
end


return M


