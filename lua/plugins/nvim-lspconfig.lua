

local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        {"williamboman/mason-lspconfig.nvim"},
        {"saghen/blink.cmp"},
    },
}

-- REMEMBER: update Mason lspcinfig

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
    vim.lsp.config("ty", { capabilities = capabilities })
    vim.lsp.config("yamlls", { capabilities = capabilities })
    -- if vim.env.WSL_DISTRO_NAME then
    -- if vim.fn.getcwd():match( "/([^/]+)") == "mnt" then
    --     vim.lsp.config("ty", {})
    -- end
    vim.diagnostic.config{
        virtual_text = true,
        underline = false,
    }
    local no_jump_servers = {
        "ruff",
        "ty",
    }
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if not client then return end
            for _, no_jump_server in ipairs(no_jump_servers) do
                if no_jump_server == client.name then
                    client.server_capabilities.definitionProvider = false
                end
            end
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local buffer = ev.buf
            vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { buffer = buffer, desc = "jump to definition" })
        end,
    })
end


return M


