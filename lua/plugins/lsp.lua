return {
    {
        "neovim/nvim-lspconfig",
    },

    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
        keys = {
            { "<leader>m", "<cmd>Mason<cr>", { noremap = true, silent = true } },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)

            vim.diagnostic.config({
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                    header = "",
                },
                update_in_insert = true,
                underline = {
                    severity = vim.diagnostic.severity.ERROR,
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                },
            })

            -- Remove the default LSP keybinds
            vim.keymap.del("n", "grr")
            vim.keymap.del("n", "grt")
            vim.keymap.del("n", "gri")
            vim.keymap.del("n", "grn")
            vim.keymap.del("n", "gra")
            vim.keymap.del("x", "gra")
        end,
    },
}
