return {
    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {}
    },

    {
        "nvim-mini/mini.pick",
        lazy = false,
        keys = {
            { "<leader>sh", "<cmd>Pick help<cr>", { noremap = true, silent = true } },
            { "<leader>sf", "<cmd>Pick files<cr>", { noremap = true, silent = true } },
            { "<leader>sg", "<cmd>Pick grep_live<cr>", { noremap = true, silent = true } },

        },
        opts = {},
        config = function ()
            require("mini.pick").setup({})

            -- Search the word under the cursor
            vim.keymap.set("n", "<leader>sw", function()
                local word = vim.fn.expand("<cword>")
                MiniPick.builtin.grep({ pattern = word })
            end)

            -- Search Neovim config files
            vim.keymap.set("n", "<leader>sn", function()
                MiniPick.builtin.files({ source = { cwd = vim.fn.stdpath("config") } })
            end)
        end
    },
}
