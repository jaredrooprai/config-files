call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-angular'

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
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-startify'
  Plug 'mhartington/formatter.nvim'
  Plug 'vim-test/vim-test'
  Plug 'windwp/nvim-autopairs'
  Plug 'vimwiki/vimwiki'

  " ui
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'famiu/feline.nvim', { 'branch': 'develop' }
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}

  " themes
  Plug 'rktjmp/lush.nvim'
  Plug 'mhinz/vim-janah'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'RRethy/nvim-treesitter-textsubjects'
  Plug 'jaredrooprai/gruvbox.nvim'
  Plug 'jaredrooprai/vim-moonfly-colors'
call plug#end()

set background=dark
colorscheme moonfly 

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
set hidden
set nuw=6 " line number padding

" remaps
inoremap jk <Esc>
map <S-j> }
map <S-k> {
noremap <Leader>y "*y
vnoremap L >gv
vnoremap H <gv
map bn :bn<cr>
map bp :bp<cr>
map bd :bd!<cr>
nmap <BS> <C-^>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-x> <cmd>:split<cr>
nnoremap <C-v> <cmd>:vsplit<cr>

" terminal remaps
:tnoremap jk <C-\><C-n>
:tnoremap <Esc> <C-\><C-n>

" vimsnek
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#s_next = 1

" nerdcommenter
map <S-c> <plug>NERDCommenterToggle

" formatter
vnoremap <leader>f :Format<CR>

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
nnoremap <silent>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <S-n> <cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border='rounded'}})<CR>
nnoremap <S-p> <cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border='rounded'}})<CR>

" nvim tree
nnoremap <leader>m <cmd>:NvimTreeToggle<CR>
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_highlight_opened_files = 1

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false

let test#javascript#jest#options = {
  \ 'all':   'TZ=jest --silent',
\}

lua <<EOF
  require'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
  require("telescope-config")
  require("nvim-lsp-installer-config")
  require("nvim-treesitter-config")
  require("nvim-cmp-config")
  require("formatter-config")
  require("gitsigns-config")
  require('nvim-tree-config')
  require("indent_blankline")
  require("lualine-config")
  require('startify-config')
  require("colorizer").setup()
  require('nvim-autopairs').setup()
  require'nvim-treesitter.configs'.setup {
    textsubjects = {
      enable = true,
      keymaps = {
        ['q'] = 'textsubjects-smart',
      }
    },
  }
EOF
