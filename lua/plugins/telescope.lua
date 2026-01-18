return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})

        -- Search the word under the cursor
        vim.keymap.set("n", "<leader>sw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        -- Search Neovim config files
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, {})

        -- Goto using LSP
        vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
    end,
}
