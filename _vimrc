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
set autochdir       "自动设当前编辑的文件所在目录为工作目录
color koehler       "使用科勒配色方案


imap <F8>   <Esc>I/* <Esc>A */
nmap <F8>   I/* <Esc>A */<Esc>j
nmap <C-F8> 0f/xxx$xxxj

"/*==============================================================================
"** msgQ.c -- the message queue module.
"**
"** MODIFY HISTORY:
"**
"** 2011-08-15 wdf Create.
"==============================================================================*/
nmap <F6> ggO/*==============================================================================<CR><BS><BS><BS>** <C-R>=expand("%:t")<CR> -- <CR>**<CR>** MODIFY HISTORY:<CR>**<CR>** <C-R>=strftime("%Y-%m-%d")<CR> wdf Create.<CR>==============================================================================*/<ESC>5kA

"/*==============================================================================
"** FILE END
"==============================================================================*/
nmap <F7> Go<CR>/*==============================================================================<CR><BS><BS><BS>** FILE END<CR>==============================================================================*/<CR><ESC>

"/*======================================================================
" * extern function
"**====================================================================*/
nmap <F9> O/*======================================================================<CR><CR><BS>====================================================================*/<Esc>0r*kA<SPACE>

"/*==============================================================================
" * - msgQ_init()
" *
" * - init MSG_QUE struct, and add it to msgQ_list
" */
nmap <F10>  0f(byeO/*==============================================================================<CR>- <Esc>pA()<CR><CR><BS><BS>- <CR>/<Esc>kA


"Ctrl+S键 保存文件
imap <C-s> <Esc>:w!<CR>a
nmap <C-s> <Esc>:w!<CR>
"F11键 快速映射m寄存器
nmap <F11> @m


if has("gui_running")
    auto GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	"set guioptions-=r " 隐藏右侧滚动条
	"set guioptions-=b " 隐藏底部滚动条
	"set showtabline=0 " 隐藏Tab栏
endif

""""""""""""""""""""""""""""""""""""""""
" ctags taglist 相关
""""""""""""""""""""""""""""""""""""""""
set tags=tags;
nmap <F12> :TlistToggle<CR>
imap <F12> <Esc>:TlistToggle<CR>i
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_SingleClick = 1 "单击tag就跳转
"let Tlist_GainFocus_On_ToggleOpen = 1 "使用:TlistToggle打开taglist窗口时，焦点自动在taglist窗口中
