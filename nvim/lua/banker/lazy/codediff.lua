if vim.g.vscode == nil then
    return {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        init = function()
            -- Single click on a file in the explorer panel opens it (plugin only does this on double click / j,k)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "codediff-explorer",
                callback = function(args)
                    vim.keymap.set("n", "<LeftRelease>", function()
                        local ok, lifecycle = pcall(require, "codediff.ui.lifecycle")
                        if not ok then
                            return
                        end
                        local explorer = lifecycle.get_panel_view(vim.api.nvim_get_current_tabpage())
                        if not explorer or not explorer.tree then
                            return
                        end
                        local node = explorer.tree:get_node()
                        if not node or not node.data or node.data.type == "group" or node.data.type == "directory" then
                            return
                        end
                        local selected = explorer.data.current_selection or {}
                        if selected.path ~= node.data.path or selected.group ~= node.data.group then
                            explorer.on_file_select(node.data)
                        end
                    end, { buffer = args.buf, silent = true, desc = "codediff: single-click opens file" })
                end,
            })

            -- Wrap long lines in the inline CodeDiff pane. The plugin hard-codes wrap=false in several
            -- places (and re-applies it on WinEnter/BufWinEnter/FileType), so flip it back afterwards.
            -- Only for the inline layout: side-by-side needs wrap off to keep scrollbind aligned.
            local function wrap_inline_diff()
                local ok, lifecycle = pcall(require, "codediff.ui.lifecycle")
                if not ok then
                    return
                end
                local sess = lifecycle.get_session(vim.api.nvim_get_current_tabpage())
                if not sess or sess.layout ~= "inline" then
                    return
                end
                local win = sess.modified_win
                if win and vim.api.nvim_win_is_valid(win) and not vim.wo[win].wrap then
                    vim.wo[win].wrap = true
                end
            end
            vim.api.nvim_create_autocmd({"OptionSet", "WinEnter", "BufWinEnter", "FileType"}, {
                callback = function(args)
                    if args.event == "OptionSet" and args.match ~= "wrap" then
                        return
                    end
                    if package.loaded["codediff.ui.lifecycle"] then
                        vim.schedule(wrap_inline_diff)
                    end
                end
            })

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
        config = function(_, opts)
            require("codediff").setup(opts)

            -- Keep focus in the explorer while moving through the file tree. Showing a file can call
            -- nvim_set_current_win(<diff pane>) (jump_to_first_change, and the single-file path used for
            -- new/untracked files never restores focus), which steals the cursor from the tree.
            -- Wrap view.show and hand focus back to the explorer if it had it.
            local view = require("codediff.ui.view")
            local show = view.show
            view.show = function(...)
                local win = vim.api.nvim_get_current_win()
                local was_explorer = vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "codediff-explorer"
                local function restore(...)
                    if was_explorer and vim.api.nvim_win_is_valid(win) and vim.api.nvim_get_current_win() ~= win then
                        vim.api.nvim_set_current_win(win)
                    end
                    return ...
                end
                return restore(show(...))
            end
        end,
        opts = {
            diff = {
                layout = "inline",
                gutter_signs = {}
            },
            explorer = {
                auto_open_on_cursor = true,
                view_mode = "tree"
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
