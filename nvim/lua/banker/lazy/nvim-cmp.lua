if vim.g.vscode == nil then
    return {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = {{
                    name = 'nvim_lsp'
                }}
            })
        end
    }
end
