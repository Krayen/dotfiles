" Indent whole file
noremap <Leader>i gg=G

" Save file
nnoremap <Leader>s :w<CR>

" Autocomplete emmet with tab key
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Using jj as Escapekey
imap jj <Esc>

" Ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1
