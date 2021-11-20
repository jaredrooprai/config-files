" >> load plugins
call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parers on update

  " themes
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'projekt0n/github-nvim-theme'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-janah'
  Plug 'mhinz/vim-startify'

  Plug 'mhartington/formatter.nvim'

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" Load the colorscheme
set background=dark
colorscheme janah 

" basic settings
let mapleader=" "
set termguicolors
set number
set relativenumber
set ignorecase
set smartcase
set nocompatible
set incsearch
set mouse=a

" remaps
inoremap jk <Esc>
map <S-j> }
map <S-k> {
noremap <Leader>y "*y
vnoremap L >gv
vnoremap H <gv

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vimsnek
let g:sneak#s_next = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" nerdcommenter
map <S-c> <plug>NERDCommenterToggle
vnoremap <leader>f :Format<CR>

" nvim tree
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" Find files using Telescope command-line sugar.
nnoremap <C-f> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-B> <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <C-Q> <cmd>Telescope help_tags<cr>

" >> Lsp key bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>
nnoremap <leader>q <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border='rounded'})<CR>
nnoremap <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border='rounded'}})<CR>
nnoremap <C-p> <cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border='rounded'}})<CR>

lua <<EOF
  require("lsp-installer")
  require("treesitter")
  require("nvim-cmp")
  require("tree")
  require("nvimformatter")
EOF

