return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
        { "<leader>e", "<cmd>Neotree toggle position=left<cr>", { noremap = true, silent = true } },
    },
    opts = {
        filesystem = {
            hijack_netrw_behavior = "disabled", -- Stop opening a file with netrw changing neotree directory
        }
    }
}
