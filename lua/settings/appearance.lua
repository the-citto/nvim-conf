
--vim.api.nvim_set_hl(0, 'normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'normalFloat', { bg = 'none' })

-- vim.cmd("colorscheme kanagawa-dragon")

-- :lua print(vim.bo.filetype)
vim.filetype.add({
    pattern = {
        ["requirements.*.*"] = "requirements",
        [".gcloudignore"] = "gitignore",
        [".coveragerc"] = "dosini",
        [".flake8"] = "dosini",
    },
})


