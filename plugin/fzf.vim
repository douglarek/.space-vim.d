" 重新设置 fzf 因为默认会重新使 airline 设置回 showmode
autocmd! FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" 设置 fzf 支持 vim popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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

nnoremap <silent> <Leader>pt  :call dim#Tags()<CR>
let g:spacevim#map#leader#desc.p.t = 'tags in the current buffer'
nnoremap <silent> <Leader>pm  :Marks<CR>
let g:spacevim#map#leader#desc.p.m = 'marks'
nnoremap <silent> <Leader>pd  :Commands<CR>
let g:spacevim#map#leader#desc.p.d = 'command'
nnoremap <silent> <Leader>pH  :Helptags<CR>
let g:spacevim#map#leader#desc.p.H = 'list the help tags'
nnoremap <silent> <Leader>pT  :Filetypes<CR>
nnoremap <silent> <Leader>pF  :GFiles<CR>
let g:spacevim#map#leader#desc.p.F = 'find-file-in-git-project'
