if vim.g.vscode == nil then
	vim.cmd("colorscheme kanagawa")
	vim.cmd("let g:sneak#label = 1")
end

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.hidden = true
vim.g.bufferline = {
	animation = false,
}
vim.opt.mouse = "a"
vim.opt.nuw = 6
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_man = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfire_pugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_netrwPlugin = 1
