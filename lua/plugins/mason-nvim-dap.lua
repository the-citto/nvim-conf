
local M = {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
        'williamboman/mason.nvim',
    }
}

M.config = function()
    local mason_nvim_dap = require 'mason-nvim-dap'
    mason_nvim_dap.setup {
        ensure_installed = {
            -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
            'cppdbg',
            'node2',
            'js',
            'bash',
            'python',
        },
        handlers = {},
        automatic_installation = true,
    }
end

return M


