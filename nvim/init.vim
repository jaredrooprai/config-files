" >> load plugins
call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parers on update

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope.nvim'
 
  " nvim cmp
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " utils
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'preservim/nerdcommenter'
  Plug 'nvim-treesitter/nvim-treesitter-angular'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-startify'

  " ui
  Plug 'mhartington/formatter.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'famiu/feline.nvim', { 'branch': 'develop' }
  Plug 'onsails/lspkind-nvim'

  " themes
  Plug 'mhinz/vim-janah'
  Plug 'ap/vim-css-color'
  Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" Load the colorscheme
set background=dark
let g:vscode_style = "dark"
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
set list
set nuw=6

" remaps
inoremap jk <Esc>
map <S-j> }
map <S-k> {
noremap <Leader>y "*y
vnoremap L >gv
vnoremap H <gv
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>
nmap <BS> <C-^>

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

" formatter
vnoremap <leader>f :Format<CR>

" nvim tree
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> <cmd>lua require('telescope.builtin').buffers()<cr>

" >> Lsp key bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>
nnoremap <leader>q <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border='rounded'})<CR>
nnoremap <S-n> <cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border='rounded'}})<CR>
nnoremap <S-p> <cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border='rounded'}})<CR>

" startify
let g:startify_bookmarks = ['~/config-files/', '~/Sites/showpass-frontend', '~/Sites/web-app']
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Files']   },
  \ ]

lua <<EOF
  require("telescope-config")
  require("nvim-lsp-installer-config")
  require("nvim-treesitter-config")
  require("nvim-cmp-config")
  require("formatter-config")
  require("gitsigns-config")
  require("indent_blankline")
EOF


