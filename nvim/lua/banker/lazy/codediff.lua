if vim.g.vscode == nil then
    return {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        opts = {
            diff = {
                gutter_signs = {}
            },
            explorer = {
                auto_open_on_cursor = true
            },
            keymaps = {
                view = {
                    quit = {"q", "ZZ"},
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
