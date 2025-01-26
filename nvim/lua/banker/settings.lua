vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.hidden = true
vim.opt.mouse = "a"

-- Disable unused built-in plugins for faster startup
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_man = 1

if vim.g.vscode == nil then
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme zenbones]])
    -- obsidian nvim
    vim.opt.conceallevel = 1
end
