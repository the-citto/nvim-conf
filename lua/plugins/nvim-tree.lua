

local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

M.config = function ()
    local api = require("nvim-tree.api")
    require"nvim-tree".setup {
        on_attach = function (bufnr)
            local opts = { buffer = bufnr }
            api.config.mappings.default_on_attach(bufnr)
            local lefty = function ()
                local node_at_cursor = api.tree.get_node_under_cursor()
                if node_at_cursor.nodes and node_at_cursor.open then
                    api.node.open.edit()
                else
                    api.node.navigate.parent()
                end
            end
            local righty = function ()
                local node_at_cursor = api.tree.get_node_under_cursor()
                if node_at_cursor.nodes and not node_at_cursor.open then
                    api.node.open.edit()
                end
            end
            vim.keymap.set("n", "h", lefty , opts )
            vim.keymap.set("n", "<Left>", lefty , opts )
            vim.keymap.set("n", "<Right>", righty , opts )
            vim.keymap.set("n", "l", righty , opts )
        end,
        actions = {
            change_dir = {
                restrict_above_cwd = true,
            },
        },
        view = {
            width = 0,
        },
        renderer = {
            special_files = {
            },
            highlight_modified = "all",
            highlight_git = true,
            highlight_diagnostics = true,
            icons = {
                modified_placement = "before",
                glyphs = {
                    git = {
                    },
                },
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
        ui = {
            confirm = {
                default_yes = true,
            },
        },
    }
end

return M






