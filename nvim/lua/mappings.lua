function Map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Nmap(shortcut, command)
	Map("n", shortcut, command)
end

function Imap(shortcut, command)
	Map("i", shortcut, command)
end

function Vmap(shortcut, command)
	Map("v", shortcut, command)
end

function Cmap(shortcut, command)
	Map("c", shortcut, command)
end

function Tmap(shortcut, command)
	Map("t", shortcut, command)
end

if vim.g.vscode == nil then
	Imap("jk", "<Esc>")
else
	Nmap('gcc', "<Plug>VSCodeCommentaryLine")
	Vmap('gcc', "<Plug>VSCodeCommentary")

	Tmap("jk", "<C-\\><C-n>")
	Tmap("<Esc>", "<C-\\><C-n>")

	Nmap("<BS>", "<C-^>")
	Nmap("q", ":BufferPick<cr>")
	Nmap("bn", ":BufferNext<cr>")
	Nmap("bp", ":BufferPrevious<cr>")
	Nmap("bd", ":BufferClose!<cr>")

	Nmap("<C-x>", ":split")
	Nmap("<C-H>", ":vsplit")
end

-- yank to clipboard
Vmap("<leader>y", '"*y')

Vmap("L", ">gv")
Vmap("H", "<gv")

Nmap("<S-j>", "}")
Nmap("<S-k>", "{")

Vmap("<S-j>", "}")
Vmap("<S-k>", "{")

Nmap("<C-J>", "<C-w><C-J>")
Nmap("<C-K>", "<C-w><C-K>")
Nmap("<C-L>", "<C-w><C-L>")
Nmap("<C-H>", "<C-w><C-H>")
