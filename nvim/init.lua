vim.cmd('set shell=/bin/zsh')
require("impatient")
require("plugins")
require("settings")
require("mappings")
require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
require("nvim-autopairs").setup()
require("plugin-configs/null-ls-config")
require("plugin-configs/telescope-config")
require("plugin-configs/nvim-lsp-installer-config")
require("plugin-configs/nvim-treesitter-config")
require("plugin-configs/gitsigns-config")
require("plugin-configs/startify-config")
require("plugin-configs/nvim-cmp-config")
require("plugin-configs/neo-tree-config")
require("indent_blankline")
