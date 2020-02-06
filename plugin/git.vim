" fugitive 的有些命令是 terminal 实现, 比如 disacrd hunk 这种,
" 关闭后回到原文件并不会 reload.
au FocusGained,BufEnter * :checktime

nnoremap <silent> <Leader>ga :Git add .<CR>
let g:spacevim#map#leader#desc.g.a = 'Git add .'
nnoremap <silent> <Leader>gD :Git checkout -p %<CR>
let g:spacevim#map#leader#desc.g.D = 'Git checkout -p %'
