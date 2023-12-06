



vim.wo.number = true
vim.o.mouse = 'a'

-- tabs stuff
vim.o.tabstop = 4       -- A TAB character looks like 4 spaces
vim.o.expandtab = true  -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4   -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4    -- Number of spaces inserted when indenting




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

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },
            
            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    --'windwp/nvim-autopairs',
    --event = "InsertEnter",
    --opts = {} -- this is equalent to setup({}) function

},
{})


require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
        },
    },
}


require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}


mason_lspconfig.setup_handlers {
    function(server_name)
    require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
    }
    end,
}




















