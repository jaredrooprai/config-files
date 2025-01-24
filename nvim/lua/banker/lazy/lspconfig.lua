return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        -- TypeScript/JavaScript LSP (tsserver)
        lspconfig.ts_ls.setup {}
    end
}
