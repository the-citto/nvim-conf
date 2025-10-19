
local M = {
  'stevearc/conform.nvim',
}



M.config = function()
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            python = {
                "isort",
                "black",
                "ruff",
            },
            rust = { "rustfmt", lsp_format = "fallback" },
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
            require("conform").format({ bufnr = args.buf })
        end,
    })
end


return M


