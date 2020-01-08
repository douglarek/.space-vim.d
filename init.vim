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
      \'fzf', 'better-defaults', 'which-key',
      \'git', 'github',
      \'lsp',
      \'formatting', 'code-snippets', 'editing',
      \'chinese',
      \'emoji',
      \'better-motion',
      \'text-align',
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

" disable clap since it can not grep multiple chars
let g:spacevim_enable_clap = 0

" lsp use coc.vim
let g:spacevim_lsp_engine = 'coc'

" Manage your own plugins.
" Refer to https://github.com/junegunn/vim-plug for more detials.
function! UserInit()
  " Vim plugin for https://github.com/cweill/gotests
  Plug 'buoto/gotests-vim'

  " Vim and Neovim plugin to reveal the commit messages under the cursor, <Leader>gm
  Plug 'rhysd/git-messenger.vim'
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
  let g:loaded_python_provider = 0
  let g:loaded_ruby_provider = 0
  let g:loaded_node_provider = 0

  " clap
  " let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  " nnoremap <silent> <Leader>kb  :Clap blines<CR>
  " nnoremap <silent> <Leader>kf  :Clap files<CR>
  " nnoremap <silent> <Leader>kh  :Clap history<CR>
  " let g:spacevim#map#leader#desc.k = get(g:spacevim#map#leader#desc, 'k', {'name' : '+clap'})
  " let g:spacevim#map#leader#desc.k.b = 'blines'
  " let g:spacevim#map#leader#desc.k.f = 'files'
  " let g:spacevim#map#leader#desc.k.h = 'history'

  " fzf
  let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  nnoremap <silent> <Leader>ph  :History<CR>
  let g:spacevim#map#leader#desc.p.h = 'v:oldfiles and open buffers'

  " coc extensions; use <C-w>o to close floating window
  let g:coc_global_extensions = [ 'coc-json', 'coc-ultisnips', 'coc-snippets', 'coc-translator', 'coc-marketplace', 'coc-java' ]
  let g:coc_user_config = {
        \'languageserver': {
          \'golang': {
            \'command': 'gopls',
            \'rootPatterns': [ 'go.mod', '.vim/', '.git/', '.hg/' ],
            \'filetypes': [ 'go' ],
          \},
        \},
        \'java.format.comments.enabled': 'true',
        \'java.format.settings.url': 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
        \'java.completion.overwrite': 'true',
        \'coc.preferences.formatOnSaveFiletypes': [ 'go', 'java' ],
  \}
  nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
  autocmd FileType java nnoremap <silent> <LocalLeader>h :CocAction('doHover')<CR>

  " go
  let g:go_auto_type_info = 1
  autocmd FileType go nnoremap <silent> <LocalLeader>a :GoAlternate<CR>
  autocmd FileType go nnoremap <silent> <LocalLeader>g :GoTests<CR>

  " formatting
  " au BufWrite *.go :Autoformat

  "emoji
  set completefunc=emoji#complete

  " vista
  let g:vista_default_executive = 'coc'
  let g:vista#renderer#enable_icon = 0

  " rainbow
  let g:rainbow_active = 0
endfunction
