" override fzf keys and add news
let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc

" a workaround since clap no fzf :Maps support
let g:spacevim#map#leader#desc['?'] = [ 'nmap', 'show-keybindings' ]

nnoremap <silent> <Leader>pb  :Clap buffers<CR>
let g:spacevim#map#leader#desc.p.b = 'open buffers'
nnoremap <silent> <Leader>pB  :Clap blines<CR>
let g:spacevim#map#leader#desc.p.B = 'lines in the current buffer'

nnoremap <silent> <Leader>pf  :Clap files<CR>
nnoremap <silent> <Leader>ph  :Clap history<CR>
nnoremap <silent> <Leader>pw  :Clap grep ++query=<cword><CR>
nnoremap <silent> <Leader>pW  :Clap grep ++query=<cword><CR>
nnoremap <silent> <Leader>pa  :Clap grep<CR>
nnoremap <silent> <Leader>pr  :Clap grep<CR>
nnoremap <silent> <Leader>ps  :Clap grep<CR>

nnoremap <silent> <Leader>pc  :Clap commits<CR>
let g:spacevim#map#leader#desc.p.c = 'git commits'
nnoremap <silent> <Leader>pC  :Clap bcommits<CR>
let g:spacevim#map#leader#desc.p.C = 'git commits for the current buffer'
nnoremap <silent> <Leader>pt  :Clap tags<CR>
let g:spacevim#map#leader#desc.p.t = 'tags in the current buffer'
nnoremap <silent> <Leader>pj  :Clap jumps<CR>
let g:spacevim#map#leader#desc.p.j = 'jumps'
nnoremap <silent> <Leader>pm  :Clap marks<CR>
let g:spacevim#map#leader#desc.p.m = 'marks'
nnoremap <silent> <Leader>py  :Clap yanks<CR>
let g:spacevim#map#leader#desc.p.y = 'yank stack of the current vim session'
nnoremap <silent> <Leader>pq  :Clap quickfix<CR>
let g:spacevim#map#leader#desc.p.q = 'entries of the quickfix list'
nnoremap <silent> <Leader>pd  :Clap command<CR>
let g:spacevim#map#leader#desc.p.d = 'command'
nnoremap <silent> <Leader>pH  :Clap help_tags<CR>
let g:spacevim#map#leader#desc.p.H = 'list the help tags'
nnoremap <silent> <Leader>pi  :Clap filer<CR>
let g:spacevim#map#leader#desc.p.i = 'ivy-like file explorer'
