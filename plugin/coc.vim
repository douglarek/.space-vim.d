let g:coc_global_extensions = [ 'coc-json', 'coc-translator', 'coc-ultisnips', 'coc-snippets', 'coc-java' , 'coc-python' ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = [ 'go', 'java', 'python', 'c', 'c++' ]

if g:spacevim.nvim
  let g:coc_user_config['diagnostic.virtualText'] = v:true
endif

" 映射 coc doHover
nnoremap <silent> <LocalLeader>H :call CocActionAsync('doHover')<CR>
" 使用,N ,P 跳过 coc-diagnostic
nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)
" 映射 coc imports
nnoremap <silent> <LocalLeader>O :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
" 映射 coc rename
nnoremap <silent> <LocalLeader>R :call CocActionAsync('rename')<CR>

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
let g:go_echo_go_info = 0

" go 和 test 文件之间切换
autocmd FileType go nnoremap <silent> <LocalLeader>A :GoAlternate<CR>
autocmd FileType go command! GoGenerateAllTest call dim#GoGenerateTests({})
autocmd FileType go command! GoGenerateFuncTest call dim#GoGenerateTests({'only': v:true})
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
autocmd Filetype java setlocal tabstop=2 shiftwidth=2 expandtab
let g:coc_user_config['java.format.comments.enabled'] = v:true
let g:coc_user_config['java.saveActions.organizeImports'] = v:true
let g:coc_user_config['java.format.settings.url'] = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml'
let g:coc_user_config['java.completion.overwrite'] = v:true

" coc translator
nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
