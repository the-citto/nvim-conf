

-- local builtin = require('telescope.builtin')i
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, {})


-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})


-- vim.keymap.set('n', '<leader>lg', function()
--     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
-- end, {})




