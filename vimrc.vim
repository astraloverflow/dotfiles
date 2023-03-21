call plug#begin()
" Color Scheme Plugins
  Plug 'ajmwagar/vim-deus'
  Plug 'NLKNguyen/papercolor-theme'
" Feature Plugins
  Plug 'tpope/vim-sensible'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
" Language Plugins
  Plug 'sheerun/vim-polyglot'
  Plug 'leafgarland/typescript-vim'
call plug#end()

set exrc
set secure

syntax enable
set number
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
set list!
set listchars=tab:▸\ ,eol:¬
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set t_Co=256
set background=dark

colorscheme deus
"colorscheme PaperColor

let g:vim_markdown_conceal=0
let g:vim_markdown_frontmatter=1
