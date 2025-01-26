-- Lazy needs a leader key to defined before it is loaded
vim.g.mapleader = " "

vim.cmd('set shell=/bin/zsh')

require("banker.lazy_init")
require("banker.mappings")
require("banker.settings")
