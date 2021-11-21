" >> load plugins
call plug#begin()
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parers on update

  " themes
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'mhinz/vim-janah'
  Plug 'rktjmp/lush.nvim'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'onsails/lspkind-nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'ap/vim-css-color'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'preservim/nerdcommenter'
 
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'mhinz/vim-startify'

  Plug 'mhartington/formatter.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'famiu/feline.nvim', { 'branch': 'develop' }

  Plug 'nvim-treesitter/nvim-treesitter-angular'
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
vnoremap <leader>f :Format<CR>

" nvim tree
nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <C-Q> <cmd>Telescope help_tags<cr>

" >> Lsp key bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>
nnoremap <leader>q <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border='rounded'})<CR>
nnoremap <S-n> <cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border='rounded'}})<CR>
nnoremap <S-p> <cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border='rounded'}})<CR>

" startify options
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.config/nvim/lua/', '~/Sites/showpass-frontend', '~/Sites/web-app']
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Files']   },
  \ ]

lua <<EOF
  require('telescope').setup {
    defaults = {
      layout_strategy = 'vertical'
    },
    extensions = {
      fzf = {
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  require('telescope').load_extension('fzf')
EOF

lua <<EOF
  require("lsp-installer")
  require("treesitter")
  require("nvim-cmp")
  require("nvimformatter")

  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '1', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '=', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '0', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '0', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    keymaps = {
      -- Default keymap options
      noremap = true,

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
      ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
      relative_time = false
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm = {
      enable = false
    },
  }


  vim.opt.termguicolors = true
  require("indent_blankline")
EOF


