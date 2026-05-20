return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    opts = {
        -- keymap = { preset = "enter" },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },
            documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "rounded" } },
            menu = {
                border = "rounded",
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
            },
            ghost_text = { enabled = false },
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
        },

        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        cmdline = {
            enabled = true,
            keymap = {
                ["<Right>"] = false,
                ["<Left>"] = false,
            },
            completion = {
                list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
}
