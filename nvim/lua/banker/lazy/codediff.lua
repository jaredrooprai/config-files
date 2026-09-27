if vim.g.vscode == nil then
    return {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        opts = {
            keymaps = {
                view = {
                    toggle_stage = "s"
                }
            }
        },
        keys = {
            {"<leader>d", "<cmd>CodeDiff<CR>", desc = "Open CodeDiff"}
        }
    }
else
    return {}
end
