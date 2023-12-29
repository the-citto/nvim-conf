

local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}


M.config = function ()
    local api = require('nvim-tree.api')
    local lib = require('nvim-tree.lib')
    require'nvim-tree'.setup {
        on_attach = function (bufnr)
            local opts = { buffer = bufnr }
            api.config.mappings.default_on_attach(bufnr)
            local lefty = function ()
                local node_at_cursor = lib.get_node_at_cursor()
                if (node_at_cursor.name == '..' or node_at_cursor.nodes) and node_at_cursor.open then
                    lib.expand_or_collapse(node_at_cursor)
                else
                    api.node.navigate.parent()
                end
            end
            local righty = function ()
                local node_at_cursor = lib.get_node_at_cursor()
                if (node_at_cursor.name == '..' or node_at_cursor.nodes) and not node_at_cursor.open then
                    lib.expand_or_collapse(node_at_cursor)
                end
            end
            vim.keymap.set('n', 'h', lefty , opts )
            vim.keymap.set('n', '<Left>', lefty , opts )
            vim.keymap.set('n', '<Right>', righty , opts )
            vim.keymap.set('n', 'l', righty , opts )
        end,
        view = {
            width = 35,
            -- side = 'right',
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






