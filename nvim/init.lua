require("settings")
require("plugins")
require("mappings")

require("plugin-configs/telescope-config")
require("plugin-configs/nvim-lsp-installer-config")
require("plugin-configs/nvim-treesitter-config")
require("plugin-configs/gitsigns-config")
require("plugin-configs/startify-config")
require("plugin-configs/null-ls-config")
require("plugin-configs/nvim-cmp-config")
require("plugin-configs/neo-tree-config")

require("indent_blankline")
require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
require("nvim-autopairs").setup()
require("nvim-treesitter.configs").setup({
	textsubjects = {
		enable = true,
		keymaps = {
			["q"] = "textsubjects-smart",
		},
	},
})
