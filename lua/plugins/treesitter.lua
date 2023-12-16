
local M = {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
}

M.config = function()
    local configs = require('nvim-treesitter.configs')
    configs.setup({
        ensure_installed = { 
            'bash', 
            'c',
            'c_sharp', 
            'cmake',
            'cpp',
            'css', 
            'elixir', 
            'gitignore', 
            'heex', 
            'html',
            'javascript',
            'json',
            'lua', 
            'markdown', 
            'python',
            'query', 
            'rust',
            'scss', 
            'sql', 
            'toml',
            'typescript',
            'vim', 
            'vimdoc',
            'xml',
            'yaml',
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },  
    })
end

return M

