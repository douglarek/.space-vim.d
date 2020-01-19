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
