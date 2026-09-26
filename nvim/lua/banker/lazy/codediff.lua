if vim.g.vscode == nil then
    return {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        keys = {
            {"<leader>d", "<cmd>CodeDiff<CR>", desc = "Open CodeDiff"}
        }
    }
else
    return {}
end
