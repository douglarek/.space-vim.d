
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

command! -bang -nargs=* BTags
      \  if has_key(g:fzf_btags_command, &filetype)
      \|   call fzf#vim#buffer_tags(<q-args>, printf(g:fzf_btags_command[&filetype], shellescape(expand('%'))), <bang>0)
      \| else
        \|   call fzf#vim#buffer_tags(<q-args>, <bang>0)
        \| endif

" use gotags for golang tags
let g:fzf_btags_command = {'go': 'gotags -silent -sort %s'}

" fzf 补充映射
let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc

nnoremap <silent> <Leader>ph  :History<CR>
let g:spacevim#map#leader#desc.p.h = 'v:oldfiles and open buffers'
nnoremap <silent> <Leader>pb  :Buffers<CR>
let g:spacevim#map#leader#desc.p.b = 'open buffers'
nnoremap <silent> <Leader>pB  :BLines<CR>
let g:spacevim#map#leader#desc.p.B = 'lines in the current buffer'
nnoremap <silent> <Leader>pc  :Commits<CR>
let g:spacevim#map#leader#desc.p.c = 'git commits'
nnoremap <silent> <Leader>pC  :BCommits<CR>
let g:spacevim#map#leader#desc.p.C = 'git commits for the current buffer'
nnoremap <silent> <Leader>pt  :BTags<CR>
let g:spacevim#map#leader#desc.p.t = 'tags in the current buffer'
nnoremap <silent> <Leader>pm  :Marks<CR>
let g:spacevim#map#leader#desc.p.m = 'marks'
nnoremap <silent> <Leader>pd  :Commands<CR>
let g:spacevim#map#leader#desc.p.d = 'command'
nnoremap <silent> <Leader>pH  :Helptags<CR>
let g:spacevim#map#leader#desc.p.H = 'list the help tags'
nnoremap <silent> <Leader>pT  :Filetypes<CR>
let g:spacevim#map#leader#desc.p.T = 'File types'
