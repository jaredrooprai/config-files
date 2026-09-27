if vim.g.vscode == nil then
    return {
        "ydkulks/cursor-dark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cursor-dark").setup({
                style = "dark"
            })
        end
    }
else
    return {}
end
