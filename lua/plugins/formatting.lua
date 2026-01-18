return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim", "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>fc",
            function()
                vim.lsp.buf.format()
            end,
            mode = { "n", "x" },
        },
        {
            "<leader>fd",
            function()
                vim.g.auto_format = not vim.g.auto_format
                local status = vim.g.auto_format and "On" or "Off"

                vim.notify("Format on-save is now " .. status)
            end,
            mode = { "n", "x" },
        },
    },
    opts = function()
        local null_ls = require("null-ls")
        local format_group = vim.api.nvim_create_augroup("tohsaka_lsp_formatting", {})

        vim.g.auto_format = true

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
            },

            -- Auto format on save
            -- Also restore cursor position pre format to stop it jumping around
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = format_group,
                        buffer = bufnr,
                        callback = function()
                            if vim.g.auto_format then
                                local cursor_pos = vim.api.nvim_win_get_cursor(0)
                                vim.lsp.buf.format({ async = false, bufnr = bufnr })
                                pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
                            end
                        end,
                    })
                end
            end,
        })
    end,
}
