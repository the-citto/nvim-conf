
local M = {
    "hat0uma/csvview.nvim",
    opts = {
        parser = { comments = { "#", "//" } },
        keymaps = {
            -- Text objects for selecting fields
            textobject_field_inner = { "if", mode = { "o", "x" } },
            textobject_field_outer = { "af", mode = { "o", "x" } },
            -- Excel-like navigation:
            -- Use <Tab> and <S-Tab> to move horizontally between fields.
            -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
            -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
            jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
            jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
            jump_next_row = { "<Enter>", mode = { "n", "v" } },
            jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
        },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}

-- M.config = function()
--     require("csvviewer").setup(
--         parser = { comments = { "#", "//" } },
--         keymaps = {
--             -- Text objects for selecting fields
--             textobject_field_inner = { "if", mode = { "o", "x" } },
--             textobject_field_outer = { "af", mode = { "o", "x" } },
--             -- Excel-like navigation:
--             -- Use <Tab> and <S-Tab> to move horizontally between fields.
--             -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
--             -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
--             jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
--             jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
--             jump_next_row = { "<Enter>", mode = { "n", "v" } },
--             jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
--         },
--     -- },
--     --     cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
--     )
-- --     local lspconfig = require("lspconfig")
-- --     local capabilities = require('blink.cmp').get_lsp_capabilities()
-- --     lspconfig.clangd.setup { capabilities = capabilities }
-- --     lspconfig.cssls.setup { capabilities = capabilities }
-- --     lspconfig.docker_compose_language_service.setup { capabilities = capabilities }
-- --     lspconfig.dockerls.setup { capabilities = capabilities }
-- --     lspconfig.gh_actions_ls.setup { capabilities = capabilities }
-- --     lspconfig.golangci_lint_ls.setup { capabilities = capabilities }
-- --     lspconfig.gopls.setup { capabilities = capabilities }
-- --     lspconfig.html.setup { capabilities = capabilities }
-- --     lspconfig.htmx.setup { capabilities = capabilities }
-- --     lspconfig.jinja_lsp.setup { capabilities = capabilities }
-- --     lspconfig.jsonls.setup { capabilities = capabilities }
-- --     lspconfig.lua_ls.setup {
-- --         capabilities = capabilities,
-- --         settings = {
-- --             Lua = {
-- --                 diagnostics = {
-- --                     globals = { "vim" },
-- --                     disable = {
-- --                         "missing-fields",
-- --                     },
-- --                 },
-- --             },
-- --         }
-- --     }
-- --     lspconfig.marksman.setup { capabilities = capabilities }
-- --     lspconfig.pyright.setup { capabilities = capabilities }
-- --     -- lspconfig.ruff.setup { capabilities = capabilities }
-- --     lspconfig.rust_analyzer.setup { capabilities = capabilities }
-- --     lspconfig.sqlls.setup { capabilities = capabilities }
-- --     lspconfig.taplo.setup { capabilities = capabilities }
-- --     lspconfig.tailwindcss.setup { capabilities = capabilities }
-- --     lspconfig.volar.setup { capabilities = capabilities }
-- --     -- lspconfig.terraformls.setup { capabilities = capabilities }
-- --     lspconfig.tflint.setup { capabilities = capabilities }
-- --     lspconfig.ts_ls.setup { capabilities = capabilities }
-- --     lspconfig.yamlls.setup { capabilities = capabilities }
-- --     vim.diagnostic.config{
-- --         virtual_text = true,
-- --         underline = false,
-- --     }
-- --     vim.api.nvim_create_autocmd('LspAttach', {
-- --         group = vim.api.nvim_create_augroup('UserLspConfig', {}),
-- --         callback = function(ev)
-- --             vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
-- --             local buffer = ev.buf
-- --             vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, { buffer = buffer, desc = "jump to definition" })
-- --         end,
-- --     })
-- end


return M

