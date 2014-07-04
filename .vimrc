"===========================================基本设置===========================================
filetype on									"打开文件类型
filetype indent on							"根据文件类型缩进
filetype plugin on 							"根据文件类型加载插件

syntax on									"打开语法检查
syntax enable								"打开语法功能

set autochdir								"自动切换文件所在目录为当前目录

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set nu										"每行显示行号
set ruler									"打开状态栏标尺
set cuc										"光标所在当前列高亮
set cul										"光标所在行高亮

set hlsearch								"高亮搜索匹配项
set incsearch								"快速搜索
set ic										"搜索忽略大小写

set lines=52								"设置窗口大小
set co=165

set autoindent								"设置自动缩进
set ts=4									"TAB宽度
set shiftwidth=4							"自动缩进长度为4
set expandtab								"把TAB替换成空格

set nobackup								"取消自动备份
set mouse=a									"启用鼠标

set showmatch								"括号自动匹配
"括号引号自动补全
:inoremap ( ()<esc>i
:inoremap ) <c-r>=ClosePair(')')<cr>
:inoremap { {<cr>}<esc>O<tab>
:inoremap } <c-r>=ClosePair('}')<cr>
:inoremap [ []<esc>i
:inoremap ] <c-r>=ClosePair(']')<cr>
:inoremap " ""<esc>i
:inoremap ' ''<esc>i
function! ClosePair(char)
		if getline('.')[col('.') - 1] == a:char
				return "\<right>"
		else
				return a:char
		endif
endfunction   #自动补全括号

"在不同窗口间移动
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
"打开新窗口快捷键
nmap :sp :split<cr>
nmap :vsp :vsplit<cr>
"用;代替;，可以少按一次shift
nmap ; :

colorscheme ron
"===========================================插件设置===========================================
set tags+=tags 								"在当前目录寻找tags,否则到上层目录寻找

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
nmap tl :TlistToggle<cr>

let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

nmap be :BufExplorer<cr>
"===========================================matlab设置=========================================
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint
"===========================================latex设置==========================================
let g:tex_flavor='latex'					"打开空的tex文件时默认为latex类型而不是tex类型
"===========================================C/C++设置==========================================
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
"关掉补全项目的预览窗口
set completeopt=menu
