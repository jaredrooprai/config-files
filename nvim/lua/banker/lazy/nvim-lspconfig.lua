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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("ts_ls", {
                capabilities = capabilities
            })
            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
            vim.lsp.enable({"ts_ls", "lua_ls"})
        end
    }
else
    return {}
end
