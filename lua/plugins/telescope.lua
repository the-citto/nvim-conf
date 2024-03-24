
local M = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "chip/telescope-software-licenses.nvim",
    }
}

M.config = function()
    require"telescope".load_extension("software-licenses")
end

return M


