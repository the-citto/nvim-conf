
-- default nvim file bropt.ser
-- vim.g.lopt.ded_netrw       = 1
-- vim.g.lopt.ded_netrwPlugin = 1

-- vim.keymap.set({"n", "v", "i"}, "<c-z>", "<cmd>u<cr>", { remap = true, desc = "undo" })
vim.keymap.set({"n", "v", "i"}, "<c-z>", "<esc>u", { remap = true, desc = "undo" })

-- tabs stuff
-- vim.opt.tabstop = 4       -- A TAB character looks like 4 spaces
-- vim.opt.expandtab = true  -- Pressing the TAB key will insert spaces instead of a TAB character
-- vim.opt.softtabstop = 4   -- Number of spaces inserted instead of a TAB character
-- vim.opt.shiftwidth = 4    -- Number of spaces inserted when indenting


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function(args)
        local indent = 4
        local expandtab = true
        local ft = vim.bo[args.buf].filetype
        -- print(ft)
        if ft == "r" or ft == "html" or ft == "htmldjango" then
            indent = 2
        elseif ft == "c" or ft == "make" then
            indent = 8
            expandtab = false
        -- elseif ft == "python" or ft == "lua" then
        --     vim.opt.foldmethod = "indent"
        --     vim.opt.foldcolumn = "4"
        --     vim.opt.foldlevel = 4
        --     vim.opt.foldlevelstart = 2
        --     vim.opt.foldnestmax = 4
        end
        vim.opt.tabstop = indent
        vim.opt.expandtab = expandtab
        vim.opt.softtabstop = indent
        vim.opt.shiftwidth = indent
    end
})


-- Set highlight opt. search
vim.opt.hlsearch = false
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- scroll-center
vim.opt.scrolloff = 10
-- cursor 
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:hor50,r-cr-o:hor20,a:blinkwait250-blinkoff500-blinkon500"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver50,r-cr-o:hor20,a:blinkwait250-blinkoff500-blinkon500"
vim.opt.cursorline = true

-- Enable mouse mode
vim.opt.mouse = "a"




