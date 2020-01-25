" Comment the following line if you don't want Vim and NeoVim to share the
" same plugin download directory.
let g:spacevim_plug_home = '~/.vim/plugged'

" Uncomment the following line to override the leader key. The default value is space key "<\Space>".
" let g:spacevim_leader = "<\Space>"

" Uncomment the following line to override the local leader key. The default value is comma ','.
" let g:spacevim_localleader = ','

" Enable the existing layers in space-vim.
" Refer to https://github.com/liuchengxu/space-vim/blob/master/layers/LAYERS.md for all available layers.
let g:spacevim_layers = [
      \'fzf',
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
let g:spacevim_enable_true_color = 1

" Uncomment the following if you have some nerd font installed.
" let g:spacevim_nerd_fonts = 1

" If you want to have more control over the layer, try using Layer command.
" if g:spacevim.gui
"   Layer 'airline'
" endif

" lsp use coc.vim
let g:spacevim_lsp_engine = 'coc'

" Manage your own plugins.
" Refer to https://github.com/junegunn/vim-plug for more detials.
function! UserInit()
  " 👏 Modern performant generic finder and dispatcher for Vim and NeoVim
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  " Vim plugin for C/C++/ObjC semantic highlighting using cquery or ccls
  if executable('ccls')
    Plug 'jackguo380/vim-lsp-cxx-highlight'
  endif

  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " The undo history visualizer for VIM
  Plug 'mbbill/undotree'

  " An incremental narrowing engine for neovim inspired by emacs helm/ivy
  if has('nvim')
    Plug 'conweller/findr.vim'
  endif
endfunction

" Override the default settings from space-vim as well as adding extras
function! UserConfig()

  " Override the default settings.
  " Uncomment the following line to disable relative number.
  " set norelativenumber

  " Adding extras.
  " Uncomment the following line If you have installed the powerline fonts.
  " It is good for airline layer.
  " let g:airline_powerline_fonts = 1

  " disable python, ruby, node health check
  if has('nvim')
    let g:loaded_python_provider = 0
    let g:loaded_ruby_provider = 0
    let g:loaded_node_provider = 0
  endif

  " clap
  source ~/.space-vim.d/clap.vim

  " fzf
  let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  nnoremap <silent> <Leader>ph  :History<CR>
  let g:spacevim#map#leader#desc.p.h = 'v:oldfiles and open buffers'

  " coc extensions; use <C-w>o to close floating window
  source ~/.space-vim.d/coc.vim

  "emoji
  set completefunc=emoji#complete

  " vista
  let g:vista_default_executive = 'coc'
  let g:vista#renderer#enable_icon = 0

  " rainbow
  let g:rainbow_active = 0

  " use AsyncRun to make vim-fugitive asynchronous
  command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

  " defx
  source ~/.space-vim.d/defx.vim

  " undotree
  let g:undotree_ShortIndicators = 1
  let g:undotree_SetFocusWhenToggle = 1

endfunction
