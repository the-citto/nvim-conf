local M = {
    "nvim-tree/nvim-web-devicons",
}


M.config = function ()
    require"nvim-web-devicons".setup {
        override_by_filename = {
            ["requirements.in"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
            ["requirements-tests.in"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
            ["requirements-dev.in"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
            ["requirements.txt"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
            ["requirements-dev.txt"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
            ["requirements-tests.txt"] = {
                icon = "",
                color = "#2D4F67",
                name = "Requirements"
            },
        }
    }
end


return M

