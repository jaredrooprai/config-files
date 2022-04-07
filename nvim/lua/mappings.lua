local v = vim

function Map(mode, shortcut, command)
	v.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
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

Imap("jk", "<Esc>")

-- yank to clipboard
Vmap("<leader>y", '"*y')

Vmap("L", ">gv")
Vmap("H", "<gv")

Tmap("jk", "<C-\\><C-n>")
Tmap("<Esc>", "<C-\\><C-n>")

Nmap("<S-j>", "}")
Nmap("<S-k>", "{")
Nmap("<BS>", "<C-^>")

Nmap("q", ":BufferPick<cr>")
Nmap("bn", ":BufferNext<cr>")
Nmap("bp", ":BufferPrevious<cr>")
Nmap("bd", ":BufferClose!<cr>")

Nmap("<C-J>", "<C-w><C-J>")
Nmap("<C-K>", "<C-w><C-K>")
Nmap("<C-L>", "<C-w><C-L>")
Nmap("<C-H>", "<C-w><C-H>")

Nmap("<C-x>", ":split")
Nmap("<C-H>", ":vsplit")

Nmap("<C-p>", ":lua require('telescope.builtin').git_files()<cr>")
Nmap("<C-q>", ":lua require('telescope.builtin').find_files()<cr>")
Nmap("<C-f>", ":lua require('telescope.builtin').live_grep()<cr>")

Nmap("gd", ":lua vim.lsp.buf.definition()<cr>")
Nmap("gr", ":lua vim.lsp.buf.references()<cr>")
Nmap("gi", ":lua vim.lsp.buf.implementation()<cr>")

Nmap("<leader>h", ":lua vim.lsp.buf.hover({border='rounded'})<cr>")
Nmap("<leader>a", ":lua vim.lsp.buf.code_action()<cr>")
Nmap("<leader>q", ":lua vim.lsp.diagnostic.show_line_diagnostics({border='rounded'})<cr>")
Nmap("<leader>n", ":lua vim.diagnostic.goto_next({border='rounded'})<cr>")
Nmap("<leader>p", ":lua vim.diagnostic.goto_prev({border='rounded'})<cr>")
Nmap("<leader>r", ":lua vim.lsp.buf.rename()<cr>")

Vmap("<leader>f", ":lua vim.lsp.buf.range_formatting()<cr>")
Nmap("<leader>F", ":lua vim.lsp.buf.formatting()<cr>")

Nmap("gv", ":Gvdiffsplit<cr>")

Nmap("<S-m>", ":Neotree toggle filesystem reveal_force_cwd<cr>")
Nmap("<S-b>", ":Neotree toggle buffers<cr>")
