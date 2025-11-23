

local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        {"williamboman/mason-lspconfig.nvim"},
        {"saghen/blink.cmp"},
    },
}

-- REMEMBER: update Mason lspcinfig

-- local ty_path = "ty"
-- local _, linux_path = next(vim.fs.find({"ty"}, {type = "file", path = "./.venv/bin"}))
-- if linux_path ~= nil then
--     ty_path = linux_path
--     -- mypy_path = vim.fn.getcwd() .. "/" .. linux_path
-- end
-- local _, win_path = next(vim.fs.find({"ty.exe"}, {type = "file", path = "./.venv/Scripts"}))
-- if win_path ~= nil then
--     ty_path = win_path
-- end


M.config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.lsp.config("clangd", { capabilities = capabilities })
    vim.lsp.config("cssls", { capabilities = capabilities })
    vim.lsp.config("docker_compose_language_service", { capabilities = capabilities })
    vim.lsp.config("dockerls", { capabilities = capabilities })
    vim.lsp.config("gh_actions_ls", { capabilities = capabilities })
    vim.lsp.config("golangci_lint_ls", { capabilities = capabilities })
    vim.lsp.config("gopls", { capabilities = capabilities })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("htmx", { capabilities = capabilities })
    vim.lsp.config("jinja_lsp", { capabilities = capabilities })
    vim.lsp.config("jsonls", { capabilities = capabilities })
    vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    disable = {
                        "missing-fields",
                    },
                },
            },
        }
    })
    vim.lsp.config("marksman", { capabilities = capabilities })
    vim.lsp.config("pyright", { capabilities = capabilities })
    vim.lsp.config("ruff", { capabilities = capabilities })
    vim.lsp.config("rust_analyzer", { capabilities = capabilities })
    vim.lsp.config("sqlls", { capabilities = capabilities })
    vim.lsp.config("taplo", { capabilities = capabilities })
    vim.lsp.config("tailwindcss", { capabilities = capabilities })
    vim.lsp.config("terraformls", { capabilities = capabilities })
    vim.lsp.config("tflint", { capabilities = capabilities })
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("ty", {
        capabilities = capabilities,
        -- settings = {
        --     yt = {
        --         cmd = {ty_path, "server" },
        --     },
        -- },
    })
    vim.lsp.config("yamlls", { capabilities = capabilities })
    vim.diagnostic.config{
        virtual_text = true,
        underline = false,
    }
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local buffer = ev.buf
            vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { buffer = buffer, desc = "jump to definition" })
        end,
    })
end


return M


