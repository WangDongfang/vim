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
" �����
""""""""""""""""""""""""""""""""""""""""
set number
set nowrap          "���Զ�����
set hlsearch        "���������ַ���
set tabstop=4       "Tab��4���ַ����
set expandtab       "Tab��ʹ�ÿո����
set autoindent      "�Զ�����
set smartindent     "������������֪����ɶ�õ�
set shiftwidth=4    "��������4���ַ����
set nobackup        "�����ɱ����ļ�
set cursorline      "������ǰ��
set autochdir       "�Զ��赱ǰ�༭���ļ�����Ŀ¼Ϊ����Ŀ¼
color koehler       "ʹ�ÿ�����ɫ����


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


"Ctrl+S�� �����ļ�
imap <C-s> <Esc>:w!<CR>a
nmap <C-s> <Esc>:w!<CR>
"F11�� ����ӳ��m�Ĵ���
nmap <F11> @m


if has("gui_running")
    auto GUIEnter * simalt ~x " ��������ʱ�Զ����
    set guioptions-=m " ���ز˵���
	set guioptions-=T " ���ع�����
	set guioptions-=L " ������������
	"set guioptions-=r " �����Ҳ������
	"set guioptions-=b " ���صײ�������
	"set showtabline=0 " ����Tab��
endif

""""""""""""""""""""""""""""""""""""""""
" ctags taglist ���
""""""""""""""""""""""""""""""""""""""""
set tags=tags;
nmap <F12> :TlistToggle<CR>
imap <F12> <Esc>:TlistToggle<CR>i
let Tlist_Exit_OnlyWindow = 1 "���taglist���������һ�����ڣ����˳�vim
"let Tlist_Use_SingleClick = 1 "����tag����ת
"let Tlist_GainFocus_On_ToggleOpen = 1 "ʹ��:TlistToggle��taglist����ʱ�������Զ���taglist������
