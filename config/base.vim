" space-vim-dark use grey comment
hi Comment guifg=#5C6370 ctermfg=59

" disable python, ruby, node health check
if has('nvim')
  let g:loaded_python_provider = 0
  let g:loaded_ruby_provider = 0
  let g:loaded_node_provider = 0
endif

"emoji
set completefunc=emoji#complete

" vista
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0

" rainbow
let g:rainbow_active = 0

" use AsyncRun to make vim-fugitive asynchronous
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" close quickfix window if asyncrun stopped, if need more info, use :copen
augroup asyncrun
  autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8, 0)
augroup END

" airline
set noshowmode
let g:airline#extensions#tabline#enabled = 0 " disable tabline at the top
let g:airline_highlighting_cache = 1

" vim-translator
nnoremap <silent> <LocalLeader>T :Translate<CR>
