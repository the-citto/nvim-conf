
local M = {
    "rshkarin/mason-nvim-lint",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-lint",
    },
}

M.config = function()
    require ("mason-nvim-lint").setup{
        automatic_install = true,
    }
end

return M

