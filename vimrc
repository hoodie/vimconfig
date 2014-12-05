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
  
" GUI AND TERMINAL {{{
  if &term=~'linux' " here we only have a nongraphic terminal
    "colorscheme default

  else " this should at least be a $TERM=='xterm', but only 256 colors
    if has("gui_running") " pick your any color you like as well as fonts
      " GUI SETTINGS {{{
      "" Menu
      " 'a' autoselect ( for copy and pasting )
      " 'c'	Use console dialogs instead of popup dialogs for simple choices.
      " 'm'	Menu bar is present.
      " 't'	Include tearoff menu items.  Currently only works for Win32, GTK+, and Motif 1.2 GUI.
      set guioptions=Tace " ace, mace, Tace, Tacet
      set mousehide " hide pointer during typing
      " GUI SETTINGS }}}

      "BRIGHT Colors:  summerfruit256, martin_krischik
      "DARK Colors:    Monokai, jellybeans, lucius, molokai_original, mustang, eddie
      "Known Fonts:    Monospace, FreeMono, DejaVu\ Sans\ Mono, Droid\ Sans\ Mono

      set guifont=Source\ Code\ Pro\ 9
      colorscheme default


    else " you have an xterm, only 256 colors
      colorscheme default
      set t_Co=256
      set mouse=a

    endif
  endif
" GUI AND TERMINAL }}}

" TAGLIST {{{
  let Tlist_Compact_Format = 0
  let Tlist_Display_Tag_Scope = 1
  let Tlist_Show_One_File = 1
  let Tlist_Auto_Update = 1
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tist_Close_On_Select = 0
  let Tlist_WinWidth = 40
" TAGLIST }}}

" SETTINGS }}}

" SHORTCUTS {{{
  let mapleader=','

	nnoremap <silent> <F9> :TlistToggle<CR>
	nnoremap <silent> <S-F9> :TlistUpdate<CR>
  map <F3> :nohl<CR>
  map <F11> :set fullscreen!<CR>
  map <F12> :NERDTreeToggle<CR>
  noremap <silent><Leader>/ :nohls<CR>

  if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a| :Tabularize /|<CR>
    vmap <Leader>a| :Tabularize /|<CR>
  endif

" SHORTCUTS }}}

" FILETYPES {{{
  filetype indent plugin on
  au Filetype cpp    setl foldmethod=marker foldmarker={,} nofoldenable
  au Filetype cpp map <F4> :call Switch_h_cpp()<CR>
  au Filetype cpp map <F8> :make -j4 <CR>

  au Filetype ruby   setl foldmethod=indent foldenable
  au Filetype python setl foldmethod=indent foldenable
  au Filetype yaml   setl foldmethod=indent foldenable

  "au BufNewFile,BufReadPost *.coffee  setl foldmethod=indent foldenable
" FILETYPES }}}

" Extensions {{{
" test
" Extensions }}}
