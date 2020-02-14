" dim#GoGenerateTests 的异步回调
func! dim#GoTestsHandler(channel, msg) abort
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
func! dim#GoGenerateTests(args) abort
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
    if g:spacevim.vim8
      call job_start('gotests -w -all ' . expand('%'), {'callback': 'dim#GoTestsHandler'})
    else
      let l:output = system('gotests -w -all ' . shellescape(expand('%')))
      echo trim(l:output) . '.' . ' To jump to test, :GoAlternate'
    endif
  endif
endfunc


" 如果是合适的文件类型则使用 vista, 否则其他的使用 fzf Btags
func! dim#Tags() abort
  let l:ft = ['go', 'java']
  if index(l:ft, &filetype) != -1
    Vista finder coc
  else
    BTags
  endif
endfunc
