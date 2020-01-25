let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
let g:spacevim#map#leader#desc.k = get(g:spacevim#map#leader#desc, 'k', {'name' : '+clap'})

nnoremap <silent> <Leader>kb  :Clap blines<CR>
let g:spacevim#map#leader#desc.k.b = 'blines'

nnoremap <silent> <Leader>kf  :Clap files<CR>
let g:spacevim#map#leader#desc.k.f = 'files'

nnoremap <silent> <Leader>kh  :Clap history<CR>
let g:spacevim#map#leader#desc.k.h = 'history'

nnoremap <silent> <Leader>kr  :Clap grep<CR>
let g:spacevim#map#leader#desc.k.r = 'grep'

nnoremap <silent> <Leader>kc  :Clap commits<CR>
let g:spacevim#map#leader#desc.k.c = 'commits'

nnoremap <silent> <Leader>kt  :Clap tags<CR>
let g:spacevim#map#leader#desc.k.t = 'tags'
