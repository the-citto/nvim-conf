
-- global mappings to be added before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- auto install of pynvim
-- require("startup.pynvim_env")
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python3"



-- lazy
require("startup.lazy")

