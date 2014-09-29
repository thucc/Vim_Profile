"<F2>:xelatex
"<F3>:pdflatex
"<F4>view pdf
map <F2> <ESC>:w<CR>\ll 
map <F3> <ESC>:w<CR>:!/usr/local/bin/pdflatex -src-specials -synctex=1 -interaction=nonstopmode %<CR><CR>
map <F4> <ESC>:w<CR>\lv
