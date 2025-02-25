
--vim.api.nvim_set_hl(0, 'normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'normalFloat', { bg = 'none' })

-- vim.cmd("colorscheme kanagawa-dragon")

-- :lua print(vim.bo.filetype)
vim.filetype.add({
    pattern = {
        ["requirements.*.*"] = "requirements",
        -- ["dev.in"] = "requirements",
        -- ["dev.txt"] = "requirements",
        -- ["tests.in"] = "requirements",
        -- ["tests.txt"] = "requirements",
        [".gcloudignore"] = "gitignore",
    },
})


