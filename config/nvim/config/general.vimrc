syntax on
syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on

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

" UltiSnips
let g:UltiSnipsSnippetsDir="$HOME/.dotfiles/config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=[$HOME."/.dotfiles/config/nvim/UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit='vertical'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" Exclude node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|xcshareddata)|(\.(swp|ico|git|svn))$'

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

let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" Custom Scripts
nnoremap <leader>c :call CreateReactClassComponent()<CR>
nnoremap <leader>f :call CreateReactFunctionalComponent()<CR>
nnoremap <leader>r :call CreateReactNativeClassComponent()<CR>

func! CreateReactFunctionalComponent()
  " Store path to current folder
  let currentPath = expand("%:h")
  
  " Choose where the component will be created
  " TODO let user type location under src/, check if it exists - if not create
  " it and then create component there. finddir(folderName, "src")
  let path = input("\nCreate functional component in  (1)src/components, (2)current location, (3)src/pages? ", "2")
  if path == "1"
    let path = 'src/components/'
  elseif path == "2"
    let path = currentPath . "/"
  elseif path == "3"
    let path = 'src/pages/'
  else
    return 
  endif

  " Store user input for component name
  echo "\nYour component will be created in " . path
  let componentName = input("Component name? " )

  let fullPathAndName = path . componentName

  " create a new directory according to user input and index and styles files
  silent call mkdir(fullPathAndName)

  " create styles file and insert skeleton
  silent exe "e " . fullPathAndName . "/styles.scss"
  silent 0r ~/.dotfiles/templates/react-styles-skeleton.scss

  " create index file and insert skeleton, replace TEMP with the componentName
  silent exe "vne " . fullPathAndName . "/index.js"
  silent 0r ~/.dotfiles/templates/react-functional-skeleton.js
  silent %s/TEMP/\=componentName/g
  silent wall
  
  echo "\nComponent " . componentName . " created in " . path
endfunc

func! CreateReactClassComponent()
  " Store path to current folder
  let currentPath = expand("%:h")
  
  " Choose where the component will be created
  " TODO let user type location under src/, check if it exists - if not create
  " it and then create component there. finddir(folderName, "src")
  let path = input("\nCreate class component in  (1)src/components, (2)current location, (3)src/pages? ", "2")
  if path == "1"
    let path = 'src/components/'
  elseif path == "2"
    let path = currentPath . "/"
  elseif path == "3"
    let path = 'src/pages/'
  else
    return 
  endif

  " Store user input for component name
  echo "\nYour component will be created in " . path
  let componentName = input("Component name? " )

  let fullPathAndName = path . componentName

  " create a new directory according to user input and index and styles files
  silent call mkdir(fullPathAndName)

  " create styles file and insert skeleton
  silent exe "e " . fullPathAndName . "/styles.module.scss"
  silent 0r ~/.dotfiles/templates/react-styles-skeleton.scss

  " create index file and insert skeleton, replace TEMP with the componentName
  silent exe "vne " . fullPathAndName . "/index.js"
  silent 0r ~/.dotfiles/templates/react-skeleton.js
  silent %s/TEMP/\=componentName/g
  silent wall
  
  echo "\nComponent " . componentName . " created in " . path
endfunc

func! CreateReactNativeClassComponent()
  " Store path to current folder
  let currentPath = expand("%:h")
  
  " Choose where the component will be created
  " TODO let user type location under src/, check if it exists - if not create
  " it and then create component there. finddir(folderName, "src")
  let path = input("\nCreate class component in  (1)src/components, (2)current location, (3)src/screens? ", "2")
  if path == "1"
    let path = 'src/components/'
  elseif path == "2"
    let path = currentPath . "/"
  elseif path == "3"
    let path = 'src/screens/'
  else
    return 
  endif

  " Store user input for component name
  echo "\nYour component will be created in " . path
  let componentName = input("Component name? " )

  let fullPathAndName = path . componentName

  " create a new directory according to user input and index and styles files
  silent call mkdir(fullPathAndName)

  " create styles file and insert skeleton
  silent exe "e " . fullPathAndName . "/styles.js"
  silent 0r ~/.dotfiles/templates/react-native-styles.js

  " create index file and insert skeleton, replace TEMP with the componentName
  silent exe "vne " . fullPathAndName . "/index.js"
  silent 0r ~/.dotfiles/templates/react-native-skeleton.js
  silent %s/TEMP/\=componentName/g
  silent wall
  
  echo "\nComponent " . componentName . " created in " . path
endfunc
