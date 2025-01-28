if vim.g.vscode == nil then
    return {
        "neovim/nvim-lspconfig",
        dependencies = {{
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = { -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                {
                    path = "${3rd}/luv/library",
                    words = {"vim%.uv"}
                }}
            }
        }},
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.ts_ls.setup {}
            lspconfig.lua_ls.setup {}

        end
    }
end
