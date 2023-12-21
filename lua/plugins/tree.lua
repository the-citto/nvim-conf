

local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        view = {
            width = 35,
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
            -- highlight_diagnostics = false,
            -- highlight_opened_files = 'none',
            -- highlight_modified = 'none',
            -- highlight_bookmarks = 'none',
            -- highlight_clipboard = 'name',
            icons = {
                git_placement = 'after',
                glyphs = {
            --         default = '',
            --         symlink = '',
            --         bookmark = '󰆤',
            --         modified = '●',
            --         folder = {
            --             arrow_closed = '',
            --             arrow_open = '',
            --             default = '',
            --             open = '',
            --             empty = '',
            --             empty_open = '',
            --             symlink = '',
            --             symlink_open = '',
            --         },
                    git = {
                        unstaged = '✗',
                        -- unstaged = ' M',
                        staged = '✓',
                        -- staged = ' S',
                        unmerged = '',
                        renamed = '➜',
                        -- renamed = ' R',
                        untracked = '★',
                        -- untracked = ' U',
                        deleted = '',
                        -- deleted = ' D',
                        ignored = '◌',
                        -- ignored = ' I',
                    },
                },
            },
        },
        update_focused_file = {
            enable = true,
        },
        diagnostics = {
            enable = true,
        --     show_on_dirs = false,
        --     show_on_open_dirs = true,
        --     debounce_delay = 50,
        --     severity = {
        --         min = vim.diagnostic.severity.HINT,
        --         max = vim.diagnostic.severity.ERROR,
        --     },
        --     icons = {
        --         hint = '',
        --         info = '',
        --         warning = '',
        --         error = '',
        --     },
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
        -- tab = {
        --     sync = {
        --         open = false,
        --         close = false,
        --         ignore = {},
        --     },
        -- },
        -- notify = {
        --     threshold = vim.log.levels.INFO,
        --     absolute_path = true,
        -- },
        ui = {
            confirm = {
                default_yes = true,
            },
        },
    }
}

return M






