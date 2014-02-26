syntax enable
syntax on

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set nu
set hlsearch
set ic
set lines=52
set co=165
set cuc
set ts=4

colorscheme ron
set tags=tags 
set autochdir

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
nmap tl :TlistToggle<cr>

let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

nmap be :BufExplorer<cr>

nmap :sp :split<cr>
nmap :vsp :vsplit<cr>
