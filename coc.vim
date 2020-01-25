let g:coc_global_extensions = [ 'coc-json', 'coc-ultisnips', 'coc-snippets', 'coc-translator', 'coc-marketplace', 'coc-java' , 'coc-python', 'coc-go' ]
let g:coc_user_config = {
      \'languageserver': {
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
      \'go.enable': v:true,
      \'go.goplsOptions': {
        \'completeUnimported': v:true,
      \},
\}

" coc-translator
nnoremap <silent> <LocalLeader>T :CocCommand translator.popup<CR>
" enable coc do hover for specific file types
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>H :call CocAction('doHover')<CR>
" skip coc-diagnostic by ,N ,P
nmap <silent> <LocalLeader>P <Plug>(coc-diagnostic-prev)
nmap <silent> <LocalLeader>N <Plug>(coc-diagnostic-next)
" coc import cleanups by ,O
autocmd FileType java,go,python nnoremap <silent> <LocalLeader>O :call CocAction('runCommand', 'editor.action.organizeImport')

" coc go settings
let g:go_template_use_pkg = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = 'gopls'
autocmd FileType go nnoremap <silent> <LocalLeader>A :CocCommand go.test.toggle<CR>
autocmd FileType go nnoremap <silent> <LocalLeader>G :CocCommand go.test.generate.file<CR>
