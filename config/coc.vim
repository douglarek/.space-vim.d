let g:coc_global_extensions = [ 'coc-json', 'coc-ultisnips', 'coc-snippets', 'coc-java' , 'coc-python' ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = [ 'go', 'java', 'python', 'c', 'c++' ]

if g:spacevim.nvim
  let g:coc_user_config['diagnostic.virtualText'] = v:true
endif

" 开启 coc doHover 功能
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>H :call CocActionAsync('doHover')<CR>
" 使用,N ,P 跳过 coc-diagnostic
nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)
" 手动清理 imports
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>O :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

" coc go 设置
let g:coc_user_config['languageserver']['golang'] = {
      \'command': 'gopls',
      \'rootPatterns': ['go.mod', '.vim/', '.git/', '.hg/'],
      \'filetypes': ['go'],
      \'initializationOptions': {
      \'completeUnimported': v:true,
      \},
      \}

let g:go_template_use_pkg = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = 'gopls'
let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled = 0

" go 和 test 文件之间切换
autocmd FileType go nnoremap <silent> <LocalLeader>A :GoAlternate<CR>
" s:GoGenerateTests 的异步回调
func! GoTestsHandler(channel, msg) abort
  " if a:msg !~? '^Generated*'
  " call setqflist([], 'r', {'title': 'gotests command outpout', 'items': [{'text': a:msg}], 'nr': '$'})
  " copen
  " endif
  if a:msg !~? '^Generated'
    echo a:msg
  else
    echo trim(a:msg, '\n') . '. To jump to test, :GoAlternate'
  endif
endfunc
" 使用 gotests 产生 go test 文件
function! s:GoGenerateTests(args) abort
  if !executable('gotests')
    echo 'gotests binary not found.'
    return
  endif

  if has_key(a:args, 'only') && a:args.only
    let l:func = search('func\s*\(([^)]\+)\)\=\s*\zs\w\+\ze(', 'bcnW')

    if l:func == 0
      echo 'no func found immediate to cursor'
      return
    endif

    let l:line = getline(l:func)
    let l:name = split(split(l:line, " ")[1], "(")[0]
    echo system('gotests -w -only ' . shellescape(l:name) . ' ' . shellescape(expand('%')))
  else
    " 如果是生成全部使用异步
    if has('channel') && has('job')
      call job_start('gotests -w -all ' . expand('%'), {'callback': 'GoTestsHandler'})
    else
      let l:output = system('gotests -w -all ' . shellescape(expand('%')))
      echo trim(l:output) . '.' . ' To jump to test, :GoAlternate'
    endif
  endif
endfunction
autocmd FileType go command! GoGenerateAllTest call s:GoGenerateTests({})
autocmd FileType go command! GoGenerateFuncTest call s:GoGenerateTests({'only': v:true})
autocmd FileType go nnoremap <silent> <LocalLeader>G :GoGenerateFuncTest<CR>:GoAlternate<CR>
" 赋值 struct 默认值
autocmd FileType go nnoremap <silent> <LocalLeader>F :GoFillStruct<CR>

" coc c/c++ 设置
let g:coc_user_config['languageserver']['ccls'] = {
      \'command': 'ccls',
      \'filetypes': ['c', 'cpp', 'cuda', 'objc', 'objcpp'],
      \'rootPatterns': ['.ccls-root', 'compile_commands.json'],
      \'initializationOptions': {
      \'cache': {
      \'directory': '.ccls-cache'
      \},
      \'highlight': { 'lsRanges' : v:true },
      \},
      \}

" coc python 设置
let g:coc_user_config['python.pythonPath'] = 'python3'
let g:coc_user_config['python.jediEnabled'] = v:false
let g:coc_user_config['python.linting.pylintEnabled'] = v:false
let g:coc_user_config['python.linting.flake8Enabled'] = v:true
let g:coc_user_config['python.linting.flake8Enabled'] = v:true

" coc java 设置
let g:coc_user_config['java.format.comments.enabled'] = v:true
let g:coc_user_config['java.format.settings.url'] = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml'
let g:coc_user_config['java.completion.overwrite'] = v:true
