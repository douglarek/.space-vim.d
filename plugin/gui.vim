set visualbell t_vb=
if has("gui_running")
  " 菜单栏中文
  let $LANG = 'zh_CN.UTF-8'
  set langmenu=zh_CN
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  if has('gui_macvim')
    set guifont=Courier:h13 " 设置代码字体
    set guifontwide=Monaco:h11 " 设置中文显示的字体
    set linespace=1 "此处取决于你中文字体的大小, 不设置有可能显示中文不完整.

    set guioptions-=b " 不使用底部滚动条
    set guioptions-=m " 不使用菜单
    set guioptions-=r " 不显示右滚动条
    set guioptions-=l " 不显示左滚动条
    set guioptions-=T " 不显示工具栏
    set guioptions-=e " 不使用标签页
    set guioptions+=c " 使用控制台对话框
    set guioptions+=k " 保持窗口大小

    au GUIEnter * set t_vb=
    " 如下配置需要你在终端程序里面设置保证你最大化 macvim 时可以填满屏幕😀
    " defaults write org.vim.MacVim MMTextInsetTop 0
    " defaults write org.vim.MacVim MMTextInsetBottom 0
    " defaults write org.vim.MacVim MMTextInsetRight 5
  endif
endif
