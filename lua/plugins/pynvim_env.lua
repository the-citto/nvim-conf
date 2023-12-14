
local pynvimpath = vim.fn.stdpath("data") .. "/pynvim_env"
if not vim.loop.fs_stat(pynvimpath) then
    vim.fn.system({
        "python",
        "-m",
        "venv",
        pynvimpath,
    })
end

vim.g.python_host_prog = pynvimpath .. '/bin/python'
vim.g.python3_host_prog = pynvimpath .. '/bin/python'




