local v = vim

v.cmd("colorscheme kanagawa")

v.g.mapleader = " "

v.opt.termguicolors = true
v.opt.number = true
v.opt.ignorecase = true
v.opt.smartcase = true
v.opt.incsearch = true
v.opt.list = true
v.opt.hidden = true

v.opt.mouse = "a"
v.opt.nuw = 6

v.g.bufferline = {
	animation = false,
}

v.cmd("let g:sneak#label = 1")

v.g.loaded_matchparen = 1
v.g.loaded_matchit = 1
v.g.loaded_logiPat = 1
v.g.loaded_rrhelper = 1
v.g.loaded_tarPlugin = 1
v.g.loaded_man = 1
v.g.loaded_gzip = 1
v.g.loaded_zipPlugin = 1
v.g.loaded_shada_plugin = 1
v.g.loaded_spellfire_pugin = 1
v.g.loaded_tutor_mode_plugin = 1
v.g.loaded_remote_plugins = 1
v.g.loaded_netrwPlugin = 1
