syntax on
syntax enable
set background=dark
colorscheme solarized

" Numbers
set number
set numberwidth=5

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set shell=/bin/zsh

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" set splitbelow
set splitright

set relativenumber
set nowrap

" show trailing whitespaces
set listchars=tab:\ \ ,trail:.
set list

" Leader
let mapleader = " "

set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

" Always utf8
set termencoding=utf-8
" set encoding=utf-8
set fileencoding=utf-8

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" Exclude node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:jsx_ext_required = 0

" Prettify
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
