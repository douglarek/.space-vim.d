" space-vim-dark 使用灰色注释
hi Comment guifg=#5C6370 ctermfg=59

" 禁用 nvim 的部分模块健康检查
if g:spacevim.nvim
  let g:loaded_python_provider = 0
  let g:loaded_ruby_provider = 0
  let g:loaded_node_provider = 0
endif

"emoji 补全
set completefunc=emoji#complete

" 关闭彩虹显示
let g:rainbow_active = 0

" 使用 AysncRun 让 vim-fugitive 某些操作异步
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" airline 状态栏
" 关闭模式消息显示, 因为 airline 已经使用颜色和文字区分
set noshowmode
let g:airline#extensions#tabline#enabled = 0 " disable tabline at the top
let g:airline_highlighting_cache = 1

" 映射 terminal 快捷键
if has('terminal') || g:spacevim.nvim
  let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  let g:spacevim#map#leader#desc['T'] = [ 'terminal', 'terminal' ]
endif

" vista
let g:vista#renderer#enable_icon = 0

" asynctasks
let g:asynctasks_term_pos = 'bottom'

" 禁用 ultisnips 快捷键, 这样 C-e 就可以了
let g:UltiSnipsExpandTrigger = "<nop>"

" 禁止 nerdcommenter 按缩进注释
let g:NERDDefaultAlign = 'left'
