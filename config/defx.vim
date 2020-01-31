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
