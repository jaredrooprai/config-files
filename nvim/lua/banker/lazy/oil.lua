if vim.g.vscode == nil then
    return {
        "stevearc/oil.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            local oil = require("oil")
            local oil_actions = require("oil.actions")

            oil.setup {
                columns = {"icon"},
                keymaps = {
                    ["<CR>"] = {
                        callback = function()
                            local entry = oil.get_cursor_entry()
                            local directory = oil.get_current_dir()
                            local is_excel_file = entry and entry.type == "file" and
                                                      entry.name:lower():match("%.xls[xmb]?$")

                            if not is_excel_file or not directory then
                                oil_actions.select.callback()
                                return
                            end

                            vim.system({"open", "-a", "Microsoft Excel", directory .. entry.name},
                                {detach = true})
                        end,
                        desc = "Open Excel files in Microsoft Excel"
                    },
                    ["<C-h>"] = false,
                    ["<C-l>"] = false,
                    ["<C-p>"] = false,
                    ["<M-h>"] = "actions.select_split"
                },
                view_options = {
                    show_hidden = true
                }
            }

            -- Open parent directory in current window
            vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", {
                desc = "Open parent directory"
            })

            -- Open parent directory in floating window
            vim.keymap.set("n", "<space>-", require("oil").toggle_float)
        end
    }
else
    return {}
end
