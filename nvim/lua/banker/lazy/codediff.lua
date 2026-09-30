if vim.g.vscode == nil then
    return {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        init = function()
            -- When nvim is launched straight into CodeDiff (e.g. `nvim -c CodeDiff`),
            -- closing the diff tab (q / ZZ) should exit nvim instead of dropping to an empty buffer.
            local from_cli = false
            for _, arg in ipairs(vim.v.argv) do
                if arg:match("^%+?CodeDiff") then
                    from_cli = true
                    break
                end
            end
            if not from_cli then
                return
            end
            vim.api.nvim_create_autocmd("TabClosed", {
                callback = function()
                    vim.schedule(function()
                        if #vim.api.nvim_list_tabpages() == 1 then
                            vim.cmd("qa")
                        end
                    end)
                end,
            })
        end,
        opts = {
            diff = {
                layout = "inline",
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
