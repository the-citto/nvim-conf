

--- telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, {})

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, {})

-- fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, {})


