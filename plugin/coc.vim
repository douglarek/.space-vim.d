let g:coc_global_extensions = [ 'coc-json', 'coc-translator', 'coc-ultisnips', 'coc-snippets', 'coc-java' , 'coc-python', 'coc-rls' ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = [ 'go', 'java', 'python', 'c', 'cpp', 'rust' ]
let g:coc_user_config['suggest.floatEnable'] = v:false
let g:coc_user_config['diagnostic.checkCurrentLine'] = v:true

" 映射 coc doHover
nnoremap <silent> <LocalLeader>H :call CocActionAsync('doHover')<CR>
" 使用,N ,P 跳过 coc-diagnostic
nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)
" 映射 coc imports
nnoremap <silent> <LocalLeader>O :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
" 映射 coc rename
nnoremap <silent> <LocalLeader>R :call CocActionAsync('rename')<CR>
" 映射 coc codeAction
xmap <LocalLeader>a  <Plug>(coc-codeaction-selected)
nmap <LocalLeader>a  <Plug>(coc-codeaction-selected)
" 映射coc quickfix
nmap <LocalLeader>Q  <Plug>(coc-fix-current)
" gotos 映射
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
let g:go_gopls_options = ['-remote=auto']
let g:go_fmt_fail_silently = 1
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0 " 使用 coc K
let g:go_imports_autosave = 0


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
      \},
      \}

" coc python 设置
let g:coc_user_config['python.pythonPath'] = 'python3'
let g:coc_user_config['python.jediEnabled'] = v:false
let g:coc_user_config['python.linting.pylintEnabled'] = v:false
let g:coc_user_config['python.linting.flake8Enabled'] = v:true
let g:coc_user_config['python.linting.flake8Enabled'] = v:true

" coc java 设置
let g:coc_user_config['java.format.comments.enabled'] = v:false
let g:coc_user_config['java.saveActions.organizeImports'] = v:true
let g:coc_user_config['java.format.settings.url'] = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml'
let g:coc_user_config['java.format.settings.profile'] = 'GoogleStyle'
let g:coc_user_config['java.completion.overwrite'] = v:true

" coc translator
nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
xnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
