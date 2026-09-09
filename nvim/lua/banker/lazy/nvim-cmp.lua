if vim.g.vscode == nil then
    return {
        "hrsh7th/nvim-cmp",
        dependencies = {"hrsh7th/cmp-nvim-lsp"},
        config = function()
            local cmp = require("cmp")

            vim.opt.completeopt = {"menu", "menuone", "noselect"}

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({
                        select = false
                    })
                }),
                sources = {{
                    name = "nvim_lsp"
                }}
            })
        end
    }
else
    return {}
end

