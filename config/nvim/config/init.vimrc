call plug#begin('~/.config/nvim/bundle')

" Define bundles via Github repos
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'altercation/vim-colors-solarized'
" Plug 'SirVer/ultisnips'
Plug 'gregsexton/MatchTag'
Plug 'Townk/vim-autoclose'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'  "Preview Colors
Plug 'jparise/vim-graphql'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

call plug#end()
