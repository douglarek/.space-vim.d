let g:coc_global_extensions = [ 'coc-json', 'coc-ultisnips', 'coc-snippets', 'coc-java' , 'coc-python' ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = [ 'go', 'java', 'python', 'c', 'c++' ]

if g:spacevim.nvim
  let g:coc_user_config['diagnostic.virtualText'] = v:true
endif

" enable coc do hover for specific file types
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>H :call CocActionAsync('doHover')<CR>
" skip coc-diagnostic by ,N ,P
nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)
" coc import cleanups by ,O
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>O :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>

" coc go settings
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
autocmd FileType go nnoremap <silent> <LocalLeader>A :CocCommand go.test.toggle<CR>
autocmd FileType go nnoremap <silent> <LocalLeader>G :CocCommand go.test.generate.file<CR>
autocmd FileType go nnoremap <silent> <LocalLeader>F :GoFillStruct<CR>

" coc ccls settings
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

" coc python settings
let g:coc_user_config['python.pythonPath'] = 'python3'
let g:coc_user_config['python.jediEnabled'] = v:false
let g:coc_user_config['python.linting.pylintEnabled'] = v:false
let g:coc_user_config['python.linting.flake8Enabled'] = v:true
let g:coc_user_config['python.linting.flake8Enabled'] = v:true

" coc java settings
let g:coc_user_config['java.format.comments.enabled'] = v:true
let g:coc_user_config['java.format.settings.url'] = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml'
let g:coc_user_config['java.completion.overwrite'] = v:true
