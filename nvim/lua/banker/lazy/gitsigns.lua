if vim.g.vscode == nil then
    return {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 300
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>"
        },
        keys = {
            {"<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Git blame line (popup)"},
            {"<leader>gB", "<cmd>Gitsigns blame<CR>", desc = "Git blame file"},
            {"<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle inline blame"}
        }
    }
else
    return {}
end
