vim.cmd('set shell=/bin/zsh')

if vim.g.vscode == nil then
    require("impatient")
    require("plugins")
end

require("settings")
require("mappings")

if vim.g.vscode == nil then
    require("colorizer").setup()
    require("Comment").setup()
    require("todo-comments").setup()
    require("nvim-autopairs").setup()
    require("plugin-configs/null-ls-config")
    require("plugin-configs/telescope-config")
    require("plugin-configs/nvim-lsp-installer-config")
    require("plugin-configs/lsp-config")
    require("plugin-configs/nvim-treesitter-config")
    require("plugin-configs/gitsigns-config")
    require("plugin-configs/startify-config")
    require("plugin-configs/nvim-cmp-config")
    require("plugin-configs/neo-tree-config")
    require("indent_blankline")
end
