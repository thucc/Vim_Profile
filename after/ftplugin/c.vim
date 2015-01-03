" OmniCppComplete initialization
call omni#cpp#complete#Init()
map <F5> <ESC>:w<CR>:make<CR>\<CR>
run macros/gdb_mappings.vim
map <F8> <ESC>:bel 30vsplit gdb-variables<CR>
map <F9> C
map <F10> S
