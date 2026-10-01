if vim.g.vscode == nil then
    return {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme("zenbones")
        end
    }
else
    return {}
end
