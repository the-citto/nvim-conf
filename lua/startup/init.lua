
-- global mappings to be added before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- auto install of pynvim
require("startup.pynvim_env")

-- lazy
require("startup.lazy")

