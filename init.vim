" 设置 vim 和 neovim 公用插件目录, 不设置则使用各自目录
let g:spacevim_plug_home = '~/.vim/plugged'

" 选择要使用的 space-vim 内建插件
let g:spacevim_layers = [
      \'airline',
      \'better-defaults',
      \'which-key',
      \'git',
      \'lsp',
      \'code-snippets',
      \'editing',
      \'chinese',
      \'emoji',
      \'programming',
      \'markdown',
      \'go']

" 终端真彩色判断
let s:colorterm=$COLORTERM
if s:colorterm == 'truecolor' || s:colorterm == '24bit'
  let g:spacevim_enable_true_color = 1
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" lsp 适用 coc.vim 引擎
let g:spacevim_lsp_engine = 'coc'

" 自定义 s:LoadScript 函数方便自定义配置加载
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
func! s:LoadScript(p, f)
  exec 'so ' . s:home . '/' . a:p . '/' . a:f . '.vim'
endfunc

" space-vim 用户自定义插件列表
function! UserInit()
  call s:LoadScript('', 'plugin')
endfunction

" space-vim 用户自定义配置
function! UserConfig()
  let l:config = ['base', 'clap', 'coc', 'netrw', 'git']
  for c in l:config
    call s:LoadScript('config', c)
  endfor
endfunction
