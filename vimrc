" Pathogen {{{

  " using ~/.vim/bundle/pathogen/autoload/pathogen.vim
  runtime ./bundle/pathogen/autoload/pathogen.vim
  execute pathogen#infect()

" }}}

" SETTINGS {{{

" BEHAVIOUR {{{
  filetype plugin indent on
  set nocompatible     " this is not vi
  set scrolloff=5      " keep at least 5 lines below/above cursor
  set sidescrolloff=5  " keep at least 5 lines left/right of cursor
  set mouse=a          " use mouse everywhere
  set autochdir        " always switch to the current file directory

" BEHAVIOUR }}}

" LOOKS {{{
  syntax on " of cause!

  set ruler           " current line number on status bar
  set nowrap          " no line wrapping
  set cursorline      " highlight current line
  set laststatus=2    " always show a statusline
  set nolist           " don't draw a $ at the end of each line

  " default tab stops
  set tabstop=2 shiftwidth=2 expandtab

  " auto/smart indent
  set autoindent smartindent

" LOOKS }}}
  


" SETTINGS }}}

" SHORTCUTS {{{
" SHORTCUTS }}}

" COLORS {{{
" COLORS }}}

" FILETYPES {{{
" FILETYPES }}}

" Extensions {{{
" test
" Extensions }}}
