return {
    "folke/trouble.nvim",
    keys = {
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>" },
        { "[t", function() require("trouble").prev({ skip_groups = true, jump = true }) end, { noremap = true, silent = true } },
        { "]t", function() require("trouble").next({ skip_groups = true, jump = true }) end, { noremap = true, silent = true } }
    },
    opts = {},
}
