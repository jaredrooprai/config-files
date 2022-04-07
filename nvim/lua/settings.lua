local v = vim

v.cmd("colorscheme kanagawa")

v.g.mapleader = " "

v.opt.termguicolors = true
v.opt.number = true
v.opt.relativenumber = true
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
