

local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L782
M.config = function ()
    local api = require("nvim-tree.api")
    local lib = require("nvim-tree.lib")
    -- local win_width = vim.api.nvim_win_get_width(0)
    -- local win_height = vim.api.nvim_win_get_height(0)
    require"nvim-tree".setup {
        on_attach = function (bufnr)
            local opts = { buffer = bufnr }
            api.config.mappings.default_on_attach(bufnr)
            local lefty = function ()
                local node_at_cursor = lib.get_node_at_cursor()
                if node_at_cursor.nodes and node_at_cursor.open then
                    api.node.open.edit()
                else
                    api.node.navigate.parent()
                end
            end
            local righty = function ()
                local node_at_cursor = lib.get_node_at_cursor()
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
            -- side = "right",
            -- float = {
            --     enable = true,
            --     open_win_config = {
            --         relative = "editor",
            --         border = "rounded",
            --         width = 50,
            --         height = 50,
            --         row = 5,
            --         column = 5,
            --     },
            -- },
        },
        renderer = {
            -- root_folder_label = ":~:s?$?/..?",
            special_files = {
                -- "Cargo.toml",
                -- "Makefile",
                -- "README.md",
                -- "readme.md"
            },
            highlight_opened_files = "all",
            highlight_modified = "all",
            highlight_git = true,
            highlight_diagnostics = true,
            -- indent_markers = {
            --     enable = true,
            -- },
            icons = {
                -- web_devicons = {
                --     folder = {
                --         enable = true,
                --     },
                --
                -- },
                -- modified_placement = "signcolumn",
                modified_placement = "before",
                -- git_placement = "after",
                glyphs = {
                    git = {
                        -- unstaged =  " -unstaged",
                        -- staged =    " -staged",
                        -- unmerged =  " -unmerged",
                        -- renamed =   " -renamed",
                        -- deleted =   " -deleted",
                        -- untracked = " -untracked",
                        -- ignored =   " -ignored",
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






