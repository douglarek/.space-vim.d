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

  " 👏 Modern performant generic finder and dispatcher for Vim and NeoVim
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'skywind3000/vim-quickui'
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
        \},
        \'java.format.comments.enabled': 'true',
        \'java.format.settings.url': 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
        \'java.completion.overwrite': 'true',
        \'coc.preferences.formatOnSaveFiletypes': [ 'go', 'java', 'python' ],
        \'python.pythonPath': 'python3',
        \'python.jediEnabled': 'false',
        \'python.linting.pylintEnabled': 'false',
        \'python.linting.flake8Enabled': 'true',
  \}
  nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
  autocmd FileType java nnoremap <silent> <LocalLeader>h :CocAction('doHover')<CR>
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

  " go
  let g:go_auto_type_info = 1
  let g:go_rename_command = 'gopls'
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

  " defx
  nnoremap <silent> <Leader>Df  :Defx<CR>
  let g:spacevim#map#leader#desc.D = get(g:spacevim#map#leader#desc, 'D', {'name' : '+defx'})
  let g:spacevim#map#leader#desc.D.f = 'defx'
  autocmd! FileType defx
  autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
      setlocal nospell
      setlocal signcolumn=no
      setlocal number
      nnoremap <silent><buffer><expr> <Space>
                  \ defx#is_directory() ?
                  \ defx#do_action('open_or_close_tree') :
                  \ defx#do_action('toggle_select')
      nnoremap <silent><buffer><expr> <Bs> defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> <Cr> defx#do_action('drop', )
      nnoremap <silent><buffer><expr> q defx#do_action('quit')
      nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive', 2)
      nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
      nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
      nnoremap <silent><buffer><expr> m defx#do_action('move')
      nnoremap <silent><buffer><expr> y defx#do_action('copy')
      nnoremap <silent><buffer><expr> Y defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> p defx#do_action('paste')
      nnoremap <silent><buffer><expr> n defx#do_action('rename')
      nnoremap <silent><buffer><expr> d defx#do_action('remove_trash')
      nnoremap <silent><buffer><expr> D defx#do_action('remove')
      nnoremap <silent><buffer><expr> f defx#do_action('search')
      nnoremap <silent><buffer><expr> a defx#do_action('new_file')
      nnoremap <silent><buffer><expr> A defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
      nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
      nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> r defx#do_action('redraw')
      nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> + defx#do_action('resize', defx#get_context().winwidth + 10)
      nnoremap <silent><buffer><expr> - defx#do_action('resize', defx#get_context().winwidth - 10)
  endfunction
  call defx#custom#option('_', {
         \ 'winwidth': 30,
         \ 'split': 'vertical',
         \ 'direction': 'botright',
         \ 'show_ignored_files': 0,
         \ 'buffer_name': '',
         \ 'toggle': 1,
         \ 'resume': 1
         \ })

  " quickui
  call quickui#menu#reset()
  let g:quickui_show_tip = 1
  let g:quickui_color_scheme = 'gruvbox'
  let g:quickui_border_style = 2
  noremap <space><space> :call quickui#menu#open()<cr>
  autocmd FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
  function! s:quickui_messages()
      let x = ''
      redir => x
      silent! messages
      redir END
      let x = substitute(x, '[\n\r]\+\%$', '', 'g')
      let content = filter(split(x, "\n"), 'v:key != ""')
      let opts = {"close":"button", "title":"Vim Messages"}
      call quickui#textbox#open(content, opts)
  endfunction
  command QuickuiMessages call s:quickui_messages()
endfunction
