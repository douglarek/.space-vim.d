" Comment the following line if you don't want Vim and NeoVim to share the
" same plugin download directory.
let g:spacevim_plug_home = '~/.vim/plugged'

" Enable the existing layers in space-vim.
" Refer to https://github.com/liuchengxu/space-vim/blob/master/layers/LAYERS.md for all available layers.
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

" Uncomment the following line if your terminal(-emulator) supports true colors.
let s:colorterm=$COLORTERM
if s:colorterm == 'truecolor' || s:colorterm == '24bit'
  let g:spacevim_enable_true_color = 1
  " also set escape characters for true colors, if needed
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" lsp use coc.vim
let g:spacevim_lsp_engine = 'coc'

" command LoadScript simplify script loading
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" Manage your own plugins.
" Refer to https://github.com/junegunn/vim-plug for more detials.
function! UserInit()
  " 👏 Modern performant generic finder and dispatcher for Vim and NeoVim
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  " Vim plugin for C/C++/ObjC semantic highlighting using cquery or ccls
  if executable('ccls')
    Plug 'jackguo380/vim-lsp-cxx-highlight'
  endif

  " 📕 Asynchronous translating plugin for Vim/Neovim
  Plug 'voldikss/vim-translator'
endfunction

" Override the default settings from space-vim as well as adding extras
function! UserConfig()
  " multiple plugins base settings
  LoadScript config/base.vim

  " clap
  LoadScript config/clap.vim

  " coc extensions; use <C-w>o to close floating window
  LoadScript config/coc.vim

  " netrw
  LoadScript config/netrw.vim

  " git
  LoadScript config/git.vim
endfunction
