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
            -- typescript-language-server still needs tsserver.js (TypeScript 6 and earlier).
            -- Projects without their own copy, including this JavaScript repo, use this one.
            local fallback_tsserver = vim.fn.expand("~/.local/share/nvim/tsserver/node_modules/typescript/lib/tsserver.js")

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                before_init = function(params, config)
                    local root = config.root_dir
                    if root and vim.fn.filereadable(vim.fs.joinpath(root, "node_modules/typescript/lib/tsserver.js")) == 1 then
                        return
                    end
                    if vim.fn.filereadable(fallback_tsserver) == 1 then
                        params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
                            tsserver = {
                                path = fallback_tsserver
                            }
                        })
                    end
                end
            })
            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
            vim.lsp.config("angularls", {
                capabilities = capabilities
            })
            vim.lsp.config("biome", {
                capabilities = capabilities
            })
            vim.lsp.config("basedpyright", {
                capabilities = capabilities,
                before_init = function(_, config)
                    local root = config.root_dir
                    if not root then
                        return
                    end
                    local python = vim.fs.joinpath(root, ".venv/bin/python")
                    if vim.fn.executable(python) == 1 then
                        config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
                            python = {
                                pythonPath = python
                            }
                        })
                    end
                end
            })
            vim.lsp.config("ruff", {
                capabilities = capabilities
            })
            vim.lsp.enable({"ts_ls", "lua_ls", "angularls", "biome", "basedpyright", "ruff"})

            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(args)
                    local filetype = vim.bo[args.buf].filetype
                    vim.lsp.buf.format({
                        bufnr = args.buf,
                        async = false,
                        filter = function(client)
                            if filetype == "python" then
                                return client.name == "ruff"
                            end
                            return client.name == "biome"
                        end
                    })
                end
            })
        end
    }
else
    return {}
end
