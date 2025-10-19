

local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}


-- local opts = {}
--
-- local mappings = {
--     ["<leader>"] = {
--         b = { "<cmd>Telescope buffers<cr>", ":Telescope buffers", },
--         -- b = {
--         --     '<cmd>lua require"telescope.builtin".buffers(require"telescope.themes".get_dropdown{previewer=false})<cr>',
--         --     "Buffers",
--         -- },
--         h = { "<cmd>Hardtime toggle<cr>", ":Hardtime toggle" },
--         f = { "<cmd>Telescope find_files<cr>", ":Telescope find_files", },
--         q = {
--             name = "quickfix",
--             c = { "<cmd>cclose<cr>", ":cclose", },
--             o = { "<cmd>copen<cr>", ":copen", },
--             r = { "<cmd>call setqflist([])<cr><cmd>cclose<cr>", "reset quickfix list", },
--         },
--         s = {
--             name = "Telescope",
--             c = { "<cmd>Telescope commands<cr>", ":Telescope commands", },
--             f = { "<cmd>Telescope find_files<cr>", ":Telescope find_files", },
--             g = {
--                 name = "git",
--                 b = { "<cmd>Telescope git_branches<cr>", ":Telescope git_branches", },
--                 c = { "<cmd>Telescope git_commit<cr>", ":Telescope git_commit", },
--                 f = { "<cmd>Telescope git_files<cr>", ":Telescope git_files", },
--                 s = { "<cmd>Telescope git_status<cr>", ":Telescope git_status", },
--             },
--             k = { "<cmd>Telescope keymaps<cr>", ":Telescope keymaps", },
--             l = { "<cmd>Telescope live_grep<cr>", ":Telescope live_grep", },
--             m = { "<cmd>Telescope marks<cr>", ":Telescope marks", },
--             o = { "<cmd>Telescope oldfiles<cr>", ":Telescope oldfiles", },
--             q = { "<cmd>Telescope quickfix<cr>", ":Telescope quickfix", },
--         },
--         t = {
--             name = "Trouble",
--             f = { "<cmd>Trouble diagnostics focus<cr>", ":Trouble diagnostics focus", },
--             t = { "<cmd>Trouble diagnostics toggle<cr>", ":Trouble diagnostics toggle", },
--         },
--     },
-- }


M.config = function()
    require("which-key").add({
        { "<leader>b",      "<cmd>Telescope buffers<cr>",           desc = ":Telescope buffers" },
        { "<leader>f",      "<cmd>Telescope find_files<cr>",        desc = ":Telescope find_files" },
        { "<leader>s",      group = "Telescope" },
        { "<leader>sc",     "<cmd>Telescope commands<cr>",          desc = ":Telescope commands", },
        { "<leader>sf",     "<cmd>Telescope find_files<cr>",        desc = ":Telescope find_files", },
        { "<leader>sk",     "<cmd>Telescope keymaps<cr>",           desc = ":Telescope keymaps", },
        { "<leader>sl",     "<cmd>Telescope live_grep<cr>",         desc = ":Telescope live_grep", },
        { "<leader>sm",     "<cmd>Telescope marks<cr>",             desc = ":Telescope marks", },
        { "<leader>so",     "<cmd>Telescope oldfiles<cr>",          desc = ":Telescope oldfiles", },
        { "<leader>sq",     "<cmd>Telescope quickfix<cr>",          desc = ":Telescope quickfix", },
        { "<leader>sg",     group = "Telescope Git" },
        { "<leader>sgb",    "<cmd>Telescope git_branches<cr>",      desc = ":Telescope git_branches", },
        { "<leader>sgc",    "<cmd>Telescope git_commit<cr>",        desc = ":Telescope git_commit", },
        { "<leader>sgf",    "<cmd>Telescope git_files<cr>",         desc = ":Telescope git_files", },
        { "<leader>sgs",    "<cmd>Telescope git_status<cr>",        desc = ":Telescope git_status", },
        { "<leader>t",      group = "Trouble" },
        { "<leader>tf",     "<cmd>Trouble diagnostics focus<cr>",   desc = ":Trouble diagnostics focus", },
        { "<leader>tt",     "<cmd>Trouble diagnostics toggle<cr>",  desc = ":Trouble diagnostics toggle", },
    })
end


return M


