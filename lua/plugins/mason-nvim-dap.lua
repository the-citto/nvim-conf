
local M = {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'mfussenegger/nvim-dap',
    }
}

M.config = function()
    local mason_nvim_dap = require 'mason-nvim-dap'
    mason_nvim_dap.setup {
        automatic_installation = true,
    }
end

return M


