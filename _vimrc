set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""
" 新添加
""""""""""""""""""""""""""""""""""""""""
set number
set nowrap          "不自动换行
set hlsearch        "高亮搜索字符串
set tabstop=4       "Tab键4个字符宽度
set expandtab       "Tab键使用空格代替
set autoindent      "自动缩进
set smartindent     "智能缩进，不知道干啥用的
set shiftwidth=4    "函数缩进4个字符宽度
set nobackup        "不生成备份文件
set cursorline      "高亮当前行
color koehler       "使用科勒配色方案



imap <C-s> <Esc>:w!<CR>a
nmap <C-s> <Esc>:w!<CR>
nmap <F11> @m       "F11键快速映射m寄存器


if has("gui_running")
    auto GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	"set guioptions-=r " 隐藏右侧滚动条
	"set guioptions-=b " 隐藏底部滚动条
	"set showtabline=0 " 隐藏Tab栏
endif

