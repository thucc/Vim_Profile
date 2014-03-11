Vim
===========

This repository contains the vim plugins and configure files in a linux environment.

You can follow the following steps to make vim a better editor for matlab:(referenced:http://www.vim.org/scripts/script.php?script_id=2407)

 	1) Syntax highlighting 
 	Copy syntax/matlab.vim to your $HOME/vimfiles/syntax directory 
 	
 	2) Correct settings in order to use the matchit.vim script 
 	In your vimrc file, add the following line : 
 	source $VIMRUNTIME/macros/matchit.vim 
 	
 	And copy ftplugin/matlab.vim to your $HOME/vimfiles/ftplugin directory 
 	
 	3) Correct indentation 
 	In your vimrc file, add the following line : 
 	source $VIMRUNTIME/macros/matchit.vim 
 	
 	And copy indent/matlab.vim to your $HOME/vimfiles/indent directory 
 	
 	4) Integration of the mlint Matlab code checker with the :make command 
 	
 	Add the following line to your vimrc file : 
 	autocmd BufEnter *.m    compiler mlint 
 	
 	And copy compiler/mlint.vim to your $HOME/vimfiles/compiler directory 
 	
 	5)Tag support 
 	Copy the .ctags to your $HOME directory. 
 	And then run the command to create tour tags file : for example : 
 	ctags -R * 
 	
 	6) help file 
 	Copy doc/matlab.txt to your $HOME/vimfiles/doc directory 
 	And then run the command to create help for matlab : 
 	:helptags $HOME/vimfiles/doc 
 	
 	And then the command 
 	:help matlab 
 	is available. 
