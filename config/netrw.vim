
let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
let g:spacevim#map#leader#desc.N = get(g:spacevim#map#leader#desc, 'N', {'name' : '+netrw'})

nnoremap <silent> <Leader>Ne :Ex<CR>
let g:spacevim#map#leader#desc.N.e = 'open Netrw'
nnoremap <silent> <Leader>Nr :Rexplore<CR>
let g:spacevim#map#leader#desc.N.r = 'return to Explorer'
