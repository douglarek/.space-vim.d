" fzf 一个良好的替代品
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" 适用于 ccls 客户端的 lsp 高亮插件
if executable('ccls')
  Plug 'jackguo380/vim-lsp-cxx-highlight'
endif

" 一个异步翻译插件
Plug 'voldikss/vim-translator'
