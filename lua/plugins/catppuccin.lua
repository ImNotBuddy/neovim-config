return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        transparent_background = true,
        styles = {
            comments = {}, -- Make comments normal style text and not itallic
        },
    },
    config = function(_, opts)
        local catppuccin = require("catppuccin")
        catppuccin.setup(opts)

        vim.cmd.colorscheme("catppuccin-macchiato")

        local bg_transparent = true
        local function toggle_transparent()
            bg_transparent = not bg_transparent
            opts.transparent_background = bg_transparent
            catppuccin.setup(opts)
            vim.cmd.colorscheme("catppuccin-macchiato")
        end

        vim.keymap.set("n", "<leader>bg", toggle_transparent, { noremap = true, silent = true })
    end,
}
