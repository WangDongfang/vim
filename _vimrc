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
color koehler       "ʹ�ÿ�����ɫ����



imap <C-s> <Esc>:w!<CR>a
nmap <C-s> <Esc>:w!<CR>
nmap <F11> @m       "F11������ӳ��m�Ĵ���


if has("gui_running")
    auto GUIEnter * simalt ~x " ��������ʱ�Զ����
    set guioptions-=m " ���ز˵���
	set guioptions-=T " ���ع�����
	set guioptions-=L " ������������
	"set guioptions-=r " �����Ҳ������
	"set guioptions-=b " ���صײ�������
	"set showtabline=0 " ����Tab��
endif

