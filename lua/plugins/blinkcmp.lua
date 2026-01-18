return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        opts = {
            keymap = {
                preset = "enter",
                -- ["<Tab>"] = { "select_and_accept" },
            },

            -- Add lazydev for better autocomplete in neovim config files
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            completion = {
                accept = { auto_brackets = { enabled = true } },
                documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "rounded" } },
                menu = {
                    draw = { treesitter = { "lsp" } },
                    border = "rounded",
                },
                ghost_text = {
                    enabled = false,
                },
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
                        auto_show = function(ctx, _)
                            return vim.fn.getcmdtype() == ":"
                        end,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },

    -- Configures LuaLS for edding neovim files
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
