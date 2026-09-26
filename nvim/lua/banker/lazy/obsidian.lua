if vim.g.vscode == nil then

    return {
        "obsidian-nvim/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        cmd = "Obsidian",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = { -- Required.
        "nvim-lua/plenary.nvim" -- see below for full list of optional dependencies 👇
        },
        opts = {
            legacy_commands = false,
            workspaces = {{
                name = "personal",
                path = "/Users/jaredrooprai/Library/Mobile Documents/iCloud~md~obsidian/Documents/Shared"
            }},
            frontmatter = {
                enabled = false,
                func = function()
                    return nil -- This ensures no frontmatter is generated
                end
            }

            -- see below for full list of options 👇
        }
    }
else
    return {}
end
