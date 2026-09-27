if vim.g.vscode == nil then
    return {
        "stevearc/oil.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            local oil = require("oil")
            local oil_actions = require("oil.actions")
            local sidebar_width = 30

            local function sidebar_window()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local ok, is_sidebar = pcall(vim.api.nvim_win_get_var, win, "oil_sidebar")
                    if ok and is_sidebar then
                        return win
                    end
                end
            end

            local function toggle_sidebar()
                local sidebar = sidebar_window()
                if sidebar then
                    if #vim.api.nvim_list_wins() > 1 then
                        vim.api.nvim_win_close(sidebar, false)
                    else
                        pcall(vim.api.nvim_win_del_var, sidebar, "oil_sidebar")
                        vim.cmd("enew")
                    end
                    return
                end

                local original = vim.api.nvim_get_current_win()
                vim.cmd("vsplit")
                vim.cmd("wincmd H")
                vim.cmd("vertical resize " .. sidebar_width)

                local original_filetype = vim.bo[vim.api.nvim_win_get_buf(original)].filetype
                if original_filetype == "oil" then
                    oil.open(vim.fn.getcwd())
                else
                    oil.open()
                end

                vim.wo.winfixwidth = true
                vim.api.nvim_win_set_var(0, "oil_sidebar", true)
            end

            local function open_in_editor(path, sidebar)
                vim.cmd("wincmd l")
                if vim.api.nvim_get_current_win() == sidebar then
                    vim.cmd("vsplit")
                end
                vim.cmd("edit " .. vim.fn.fnameescape(path))
                vim.api.nvim_set_current_win(sidebar)
            end

            oil.setup {
                columns = {"icon"},
                watch_for_changes = true,
                win_options = {
                    number = false,
                    relativenumber = false,
                    signcolumn = "no",
                    foldcolumn = "0",
                    list = false,
                    wrap = false
                },
                keymaps = {
                    ["<CR>"] = {
                        callback = function()
                            local entry = oil.get_cursor_entry()
                            local directory = oil.get_current_dir()
                            local is_excel_file = entry and entry.type == "file" and
                                                      entry.name:lower():match("%.xls[xmb]?$")

                            if is_excel_file and directory then
                                vim.system({"open", "-a", "Microsoft Excel", directory .. entry.name},
                                    {detach = true})
                                return
                            end

                            local sidebar = sidebar_window()
                            local in_sidebar = sidebar and sidebar == vim.api.nvim_get_current_win()
                            if not in_sidebar or not entry or not directory then
                                oil_actions.select.callback()
                                return
                            end

                            if entry.type == "directory" then
                                oil.select()
                                return
                            end

                            if entry.type == "file" then
                                open_in_editor(directory .. entry.name, sidebar)
                                return
                            end

                            oil_actions.select.callback()
                        end,
                        desc = "Open file, or enter directory in the sidebar"
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

            vim.keymap.set("n", "<leader>o", toggle_sidebar, {
                desc = "Toggle file explorer"
            })

            -- Open parent directory in floating window
            vim.keymap.set("n", "<space>-", require("oil").toggle_float)
        end
    }
else
    return {}
end
