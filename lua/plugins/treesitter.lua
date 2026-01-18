return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "python",
                "vimdoc",
            },
        },
        config = function(_, opts)
            local treesitter = require("nvim-treesitter")
            treesitter.setup()

            -- Find what parsers are not installed from the ensure_installed list
            local installed = treesitter.get_installed("parsers")
            local not_installed = vim.tbl_filter(function(parser)
                return not vim.tbl_contains(installed, parser)
            end, opts.ensure_installed)

            -- Log any parsers that need to be intalled
            vim.schedule(function()
                if #not_installed > 0 then
                    vim.notify(
                        "Treesitter parsers not installed:\n- " .. table.concat(not_installed, "\n- "),
                        vim.log.levels.WARN
                    )
                end
            end)

            -- Intall any missing parsers
            if #not_installed > 0 then
                require("nvim-treesitter").install(not_installed)
            end

            -- Enable the treesitter features
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("tohsaka_treesitter", { clear = true }),
                pattern = opts.ensure_installed,
                callback = function(event)
                    vim.treesitter.start(event.buf)                                   -- Highligting code
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Indenting

                    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"         -- Code folding
                    vim.wo[0][0].foldmethod = "expr"
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        keys = {
            { "<leader>c", "<cmd>TSContext toggle<cr>", { noremap = true, silent = true } },
        },
        opts = {
            enable = false, -- Hide the context by default
        },
    },
}
