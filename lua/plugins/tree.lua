

local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}


M.config = function ()
    -- local api = require('nvim-tree.api')
    -- local function opts(desc)
    --     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    -- end

    -- local core = require "nvim-tree.core"
    -- local node = core.get_explorer()
    -- if node then
    --     print(node.type)
    -- end

    -- vim.keymap.set('n', 'h',       api.node.navigate.parent,            opts('Parent Directory'))
    -- vim.keymap.set('n', '<Left>',  api.node.navigate.parent,            opts('Parent Directory'))
    require'nvim-tree'.setup {
        view = {
            width = 35,
            -- side = 'left',
        },
        renderer = {
            -- root_folder_label = ':~:s?$?/..?',
            special_files = { 
                'Cargo.toml', 
                'Makefile', 
                'README.md', 
                'readme.md' 
            },
            highlight_git = true,
            highlight_diagnostics = true,
            icons = {
                git_placement = 'after',
            },
        },
        update_focused_file = {
            enable = true,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        modified = {
            enable = true,
        },
        filters = {
            git_ignored = false,
        },
        actions = {
            change_dir = {
                restrict_above_cwd = true,
            },
        },
        ui = {
            confirm = {
                default_yes = true,
            },
        },
    }
end

return M






