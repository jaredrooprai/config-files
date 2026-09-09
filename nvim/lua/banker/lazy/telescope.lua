if vim.g.vscode == nil then
    return {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            local actions = require("telescope.actions")
            local action_set = require("telescope.actions.set")
            local action_state = require("telescope.actions.state")

            local function open_file(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                local path = entry and (entry.path or entry.filename or entry.value)
                local is_excel_file = type(path) == "string" and
                                          path:lower():match("%.xls[xmb]?$")

                if not is_excel_file then
                    action_set.select(prompt_bufnr, "default")
                    return
                end

                actions.close(prompt_bufnr)
                vim.system({"open", "-a", "Microsoft Excel", vim.fs.abspath(path)}, {
                    detach = true
                })
            end

            require("telescope").setup {
                pickers = {
                    find_files = {
                        mappings = {
                            i = {
                                ["<CR>"] = open_file
                            },
                            n = {
                                ["<CR>"] = open_file
                            }
                        }
                    }
                }
            }
        end
    }
else
    return {}
end
