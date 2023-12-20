
local M = {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
    --     plugins = {
    --         marks = true, -- shows a list of your marks on ' and `
    --         registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    --         -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    --         -- No actual key bindings are created
    --         spelling = {
    --             -- enabling this will show WhichKey when pressing z= to select spelling suggestionsenabled
    --             enabled = true,
    --             suggestions = 20, -- how many suggestions should be shown in the list?
    --         },
    --         presets = {
    --             operators = true, -- adds help for operators like d, y, ...
    --             motions = true, -- adds help for motions
    --             text_objects = true, -- help for text objects triggered after entering an operator
    --             windows = true, -- default bindings on <c-w>
    --             nav = true, -- misc bindings to work with windows
    --             z = true, -- bindings for folds, spelling and others prefixed with z
    --             g = true, -- bindings for prefixed with g
    --         },
    --     },
    --     -- add operators that will trigger motion and text object completion
    --     -- to enable all native operators, set the preset / operators plugin above
    --     operators = { gc = "Comments" },
    --     key_labels = {
    --         -- override the label used to display some keys. It doesn't effect WK in any other way.
    --         -- For example:
    --         -- ["<space>"] = "SPC",
    --         -- ["<cr>"] = "RET",
    --         -- ["<tab>"] = "TAB",
    --     },
    --     motions = {
    --         count = true,
    --     },
    --     icons = {
    --         breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    --         separator = "➜", -- symbol used between a key and it's label
    --         group = "+", -- symbol prepended to a group
    --     },
    --     popup_mappings = {
    --         scroll_down = "<c-d>", -- binding to scroll down inside the popup
    --         scroll_up = "<c-u>", -- binding to scroll up inside the popup
    --     },
    --     window = {
    --         border = "none", -- none, single, double, shadow
    --         position = "bottom", -- bottom, top
    --         -- extra window margin [top, right, bottom, left].
    --         -- When between 0 and 1, will be treated as a percentage of the screen size.
    --         margin = { 1, 0, 1, 0 },
    --         padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    --         winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    --         zindex = 1000, -- positive value to position WhichKey above other floating windows.
    --     },
    --     layout = {
    --         height = { min = 4, max = 25 }, -- min and max height of the columns
    --         width = { min = 20, max = 50 }, -- min and max width of the columns
    --         spacing = 3, -- spacing between columns
    --         align = "left", -- align columns left, center or right
    --     },
    --     ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    --     -- hide mapping boilerplate
    --     hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
    --     show_help = true, -- show a help message in the command line for using WhichKey
    --     show_keys = true, -- show the currently pressed key and its label as a message in the command line
    --     triggers = "auto", -- automatically setup triggers
    --     -- triggers = {"<leader>"} -- or specifiy a list manually
    --     -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    --     triggers_nowait = {
    --         -- marks
    --         "`",
    --         "'",
    --         "g`",
    --         "g'",
    --         -- registers
    --         '"',
    --         "<c-r>",
    --         -- spelling
    --         "z=",
    --     },
    --     triggers_blacklist = {
    --         -- list of mode / prefixes that should never be hooked by WhichKey
    --         -- this is mostly relevant for keymaps that start with a native binding
    --         i = { "j", "k" },
    --         v = { "j", "k" },
    --     },
    --     -- disable the WhichKey popup for certain buf types and file types.
    --     -- Disabled by default for Telescope
    --     disable = {
    --         buftypes = {},
    --         filetypes = {},
    --     },
    }
}

local opts = {
--     mode = 'n', -- NORMAL mode
--     -- prefix: use "<leader>f" for example for mapping everything related to finding files
--     -- the prefix is prepended to every mapping part of `mappings`
--     prefix = '',
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
--     expr = false, -- use `expr` when creating keymaps
}


    -- Actions
    -- map('n', '<leader>hs', gs.stage_hunk)
    -- map('n', '<leader>hr', gs.reset_hunk)
    -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)
    -- -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
-- function _G.set_terminal_keymaps()
--     local opts = {buffer = 0}
--     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--     vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--     vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--     vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--     vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
-- end
-- vim.keymap.set('n', '<leader>tff', require('telescope.builtin').find_files, {})
-- vim.keymap.set('n', '<leader>tlg', require('telescope.builtin').live_grep, {})
-- vim.keymap.set('n', '<leader>tgf', require('telescope.builtin').git_files, {})
-- vim.keymap.set('n', '<leader>tof', require('telescope.builtin').oldfiles, {})
--

-- local buffer_func = function()
--     require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})
-- end

local mappings = {
    ['<leader>'] = {
        b = {
            "<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown{previewer=false})<cr>",
            "Buffers",
        },
        f = {
            name = 'Telescope',
            f = { '<cmd>Telescope find_files<cr>', ':Telescope find_files', },
            g = { '<cmd>Telescope git_files<cr>', ':Telescope git_files', },
            l = { '<cmd>Telescope live_grep<cr>', ':Telescope live_grep', },
            o = { '<cmd>Telescope oldfiles<cr>', ':Telescope oldfiles', },
            s = { '<cmd>Telescope software-licenses find<cr>', ':Telescope software-licenses find', },
        },
        g = {
            name = 'Git',
            -- f = { '<cmd>Git<cr>', ':Git (fugitive git status)' },
            s = {
                name = 'GitSigns',
                b = { '<cmd>Gitsigns toggle_current_line_blame<cr>', ':GitSigns toggle_current_line_blame' },
            },
        },
        -- u = {
        --     name = 'Undotree',
        --     t = { '<cmd>UndotreeToggle<cr>', ':UndotreeToggle' },
        -- },
    },
}

M.config = function()
    require('which-key').register(mappings, opts)
end


return M


