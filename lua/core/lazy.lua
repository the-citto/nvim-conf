
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
        -- theme
        'rebelot/kanagawa.nvim',
        config = function()
            vim.cmd("colorscheme kanagawa-dragon")
        end,
    },

    -- mason 
    "williamboman/mason.nvim",
    -- lsp
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- dap
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    -- Linters
    'mfussenegger/nvim-lint',
    -- Formatters
    -- 'mhartington/formatter.nvim'

},
{})










