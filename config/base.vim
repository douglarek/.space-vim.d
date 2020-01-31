" space-vim-dark 使用灰色注释
hi Comment guifg=#5C6370 ctermfg=59

" 禁用 nvim 的部分模块健康检查
if has('nvim')
  let g:loaded_python_provider = 0
  let g:loaded_ruby_provider = 0
  let g:loaded_node_provider = 0
endif

"emoji 补全
set completefunc=emoji#complete

" vista 类 tagbar 插件
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0

" 关闭彩虹显示
let g:rainbow_active = 0

" 使用 AysncRun 让 vim-fugitive 某些操作异步
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" 执行完毕 asyncrun 之后自动关闭 quickfix, 如果想查看可以使用 :copen
augroup asyncrun
  autocmd User AsyncRunStop call asyncrun#quickfix_toggle(8, 0)
augroup END

" airline 状态栏
" 关闭模式消息显示, 因为 airline 已经使用颜色和文字区分
set noshowmode
let g:airline#extensions#tabline#enabled = 0 " disable tabline at the top
let g:airline_highlighting_cache = 1

" 映射 vim 翻译插件
nnoremap <silent> <LocalLeader>T :Translate<CR>
