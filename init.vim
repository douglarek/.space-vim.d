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
  " Vim plugin for https://github.com/cweill/gotests
  Plug 'buoto/gotests-vim'

  " 👏 Modern performant generic finder and dispatcher for Vim and NeoVim
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }


  " Vim plugin for C/C++/ObjC semantic highlighting using cquery or ccls
  if executable('ccls')
    Plug 'jackguo380/vim-lsp-cxx-highlight'
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
  let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  nnoremap <silent> <Leader>kb  :Clap blines<CR>
  nnoremap <silent> <Leader>kf  :Clap files<CR>
  nnoremap <silent> <Leader>kh  :Clap history<CR>
  nnoremap <silent> <Leader>kr  :Clap grep<CR>
  nnoremap <silent> <Leader>kc  :Clap commits<CR>
  nnoremap <silent> <Leader>kt  :Clap tags<CR>
  let g:spacevim#map#leader#desc.k = get(g:spacevim#map#leader#desc, 'k', {'name' : '+clap'})
  let g:spacevim#map#leader#desc.k.b = 'blines'
  let g:spacevim#map#leader#desc.k.f = 'files'
  let g:spacevim#map#leader#desc.k.h = 'history'
  let g:spacevim#map#leader#desc.k.r = 'grep'
  let g:spacevim#map#leader#desc.k.c = 'commits'
  let g:spacevim#map#leader#desc.k.t = 'tags'

  " fzf
  let g:spacevim#map#leader#desc = g:spacevim#map#leader#desc
  nnoremap <silent> <Leader>ph  :History<CR>
  let g:spacevim#map#leader#desc.p.h = 'v:oldfiles and open buffers'

  " coc extensions; use <C-w>o to close floating window
  let g:coc_global_extensions = [ 'coc-json', 'coc-ultisnips', 'coc-snippets', 'coc-translator', 'coc-marketplace', 'coc-java' , 'coc-python' ]
  let g:coc_user_config = {
        \'languageserver': {
          \'golang': {
            \'command': 'gopls',
            \'rootPatterns': [ 'go.mod', '.vim/', '.git/', '.hg/' ],
            \'filetypes': [ 'go' ],
          \},
          \"ccls": {
            \'command': 'ccls',
            \'filetypes': ['c', 'cpp', 'cuda', 'objc', 'objcpp'],
            \'rootPatterns': ['.ccls-root', 'compile_commands.json'],
            \'initializationOptions': {
              \'cache': {
              \'directory': '.ccls-cache'
              \},
              \'highlight': { 'lsRanges' : v:true },
            \}
          \},
        \},
        \'java.format.comments.enabled': v:true,
        \'java.format.settings.url': 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
        \'java.completion.overwrite': v:true,
        \'coc.preferences.formatOnSaveFiletypes': [ 'go', 'java', 'python', 'c', 'c++' ],
        \'python.pythonPath': 'python3',
        \'python.jediEnabled': v:false,
        \'python.linting.pylintEnabled': v:false,
        \'python.linting.flake8Enabled': v:true,
  \}
  nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
  autocmd FileType java nnoremap <silent> <LocalLeader>h :CocAction('doHover')<CR>
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
  nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
  nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)

  " go
  let g:go_auto_type_info = 1
  let g:go_rename_command = 'gopls'
  autocmd FileType go nnoremap <silent> <LocalLeader>a :GoAlternate<CR>
  autocmd FileType go nnoremap <silent> <LocalLeader>g :GoTests<CR>:GoAlternate<CR>

  "emoji
  set completefunc=emoji#complete

  " vista
  let g:vista_default_executive = 'coc'
  let g:vista#renderer#enable_icon = 0

  " rainbow
  let g:rainbow_active = 0

  " use AsyncRun to make vim-fugitive asynchronous
  command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
endfunction
