"===========================================basic settings=====================
set nocompatible                            "disable compatible model
set backspace=start,eol
filetype on									"enable file type dectection
filetype indent on							"indent according to file type
filetype plugin on 							"load plugin according to file type

syntax on									"enable grammar check
syntax enable								"enable grammar

set autochdir								"automaticlly change directory

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set nu										"display row number
set ruler									"enable ruler of status bar
set cuc										"highlight current column
set cul										"highlight current row

set hlsearch								"highlight serach
set incsearch								"quick search
set ic										"ignore case

"set lines=52								"set window size
"set co=165

set autoindent								"automatic indent
set ts=4									"tab width
set shiftwidth=4							"auto tab width is 4
set expandtab								"replace tab with space
set smartindent
set softtabstop=4

set nobackup								"disable automaticlly back up
set mouse=a			    					"enable mouse

set statusline=[%F]%y                       "show file name,file type
set statusline+=%=[%{&ff}]                  "show file format(DOS,Unix)
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"} "show encoding
set statusline+=[Line=%l/%L][Column=%c][%p%%] "show row and column number
set laststatus=2

set showmatch								"brackets match
"automaticlly complete brackets and quotation
":inoremap ( ()<esc>i
":inoremap ) <c-r>=ClosePair(')')<cr>
":inoremap { {<cr>}<esc>O<tab>
":inoremap } <c-r>=ClosePair('}')<cr>
":inoremap [ []<esc>i
":inoremap ] <c-r>=ClosePair(']')<cr>
":inoremap " ""<esc>i
":inoremap ' ''<esc>i
"function! ClosePair(char)
"		if getline('.')[col('.') - 1] == a:char
"				return "\<right>"
"		else
"				return a:char
"		endif
"endfunction

"move between different windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
"hot key for opening new window
nmap :sp :split<cr>
nmap :vsp :vsplit<cr>
"replace : with ;
nmap ; :

"in visual mode,ctrl+c and ctrl+v are used to copy and paste,also compatible
"with other programs
vmap <C-C> "+y
vmap <C-V> "+p

colorscheme ron
"===========================================flugin setting=====================
set tags+=tags 	"search tag under current directory,if not found,go to upper directory
if has("win32")
  let Tlist_Ctags_Cmd="ctags"
else
  let Tlist_Ctags_Cmd="/usr/bin/ctags"
endif
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
nmap tl :TlistToggle<cr>

let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

nmap be :BufExplorer<cr>
"===========================================matlab setting======================
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint
"===========================================latex setting=======================
let g:tex_flavor='latex'
"===========================================C/C++ setting=======================
"configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp_src/tags-cpp
"build tags of your own project with CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"disable preview window of completion
set completeopt=menu

"===========================================windows setting=====================
if has("win32")
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
  behave mswin

  au GUIEnter * call libcallnr ( "vimtweak.dll" , "SetAlpha" , 200)
  au GUIEnter * simalt ~x

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
 endif
