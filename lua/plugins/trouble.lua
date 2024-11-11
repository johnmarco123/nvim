return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        follow = true,
        auto_jump = true,
    },
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "[t",
            "<cmd>Trouble diagnostics next focus=true<cr>",
        },
        {
            "]t",
            "<cmd>Trouble diagnostics prev focus=true<cr>",
        },
    },
}
