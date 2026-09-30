if vim.g.vscode == nil then
    return {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"},
        opts = {},
        keys = {
            {"<leader>mt", "<cmd>RenderMarkdown buf_toggle<CR>", desc = "Toggle markdown rendering"}
        }
    }
else
    return {}
end
