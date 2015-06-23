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
  "set hidden           " hides buffers instead of closing them
  set novisualbell     " don't beep
  set noerrorbells     " don't beep
  set splitbelow       " open split below instead above
  "set splitright       " open split right instead leeft
  set pastetoggle=<F2> " disables autoindenting etc for pasting

  set ttyfast
  "set backup
  "set backupdir=~/.vim/backup
  "set directory=~/.vim/swap
  "set noswapfile

" BEHAVIOUR }}}

" LOOKS {{{
  syntax on " of cause!

  set number
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
      set guioptions=Tacerb " ace, mace, Tace, Tacet
      set mousehide " hide pointer during typing
      " GUI SETTINGS }}}

      "BRIGHT Colors:  summerfruit256, martin_krischik
      "DARK Colors:    Monokai, jellybeans, lucius, molokai_original, mustang, eddie
      "Known Fonts:    Monospace, FreeMono, DejaVu\ Sans\ Mono, Droid\ Sans\ Mono

      set guifont=Fira\ Mono\ 9
      "set guifont=Source\ Code\ Pro\ 9
      "set guifont=Meslo\ LG\ M\ DZ\ 9
      "colorscheme wombat
      colorscheme lucius


    else " you have an xterm, only 256 colors
      colorscheme wombat256
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

" TAGBAR {{{
  let g:tagbar_left=1
  let g:tagbar_sort=0
" TAGBAR }}}

" SETTINGS }}}

" SHORTCUTS {{{
  let mapleader=','

  nnoremap <F5> :GundoToggle<CR>

  "nmap <F8> :TagbarToggle<CR>
  nmap <F8> :cwindow<CR>
  nmap <S-F8> :make -j3<CR>
	"au Filetype cpp,ruby,python,java nnoremap <silent><buffer> <F9> :TlistToggle<CR>
	"au Filetype cpp,ruby,python,java nnoremap <silent><buffer> <S-F9> :TlistUpdate<CR>
	au Filetype cpp,ruby,python,java nnoremap <silent><buffer> <F9> :TagbarToggle<CR>
  au Filetype cpp,c nmap <S-F8> :make -j3<CR>

  map <F10> :NERDTreeToggle<CR>
  map <F11> :set fullscreen!<CR>
  noremap <silent><Leader>/ :nohls<CR>

" Tabularize {{{
  if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
  endif
" Tabularize }}}

" SHORTCUTS }}}

" FILETYPES {{{
  filetype indent plugin on
" cpp {{{
  au Filetype cpp setl foldmethod=marker foldmarker={,} nofoldenable
  au Filetype cpp map <F4> :call Switch_h_cpp()<CR>
  au Filetype cpp map <F8> :make -j4 <CR>
" cpp }}}

  au Filetype ruby   setl foldmethod=indent foldenable
  au Filetype python setl foldmethod=indent foldenable
  au Filetype python setl shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au Filetype yaml   setl foldmethod=indent foldenable
  au Filetype vim    setl foldmethod=marker foldenable shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  au Filetype rust   setl foldmethod=marker foldmarker={,} nofoldenable

  "au BufRead,BufNewFile .vimrc,vimrc  set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  "au BufRead,BufNewFile *.css         set shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  "au BufRead,BufNewFile *.js,*.java   set shiftwidth=2 tabstop=4 smarttab expandtab softtabstop=4
  au BufRead,BufNewFile *.coffee      set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au BufNewFile,BufReadPost *.coffee  setl foldmethod=indent foldenable

" FILETYPES }}}

" Extensions {{{
" rust {{{
 set hidden
 let g:racer_cmd = "/usr/bin/racer"
 let $RUST_SRC_PATH="/home/hendrik/code/hub/rust/src/"
" rust }}}

" navigation {{{
  inoremap jj <ESC>
  inoremap kk <ESC>
  set wildmenu
  nnoremap k gk
  nnoremap j gj
  " navigation }}}

" easier search {{{
  nnoremap / /\v
  vnoremap / /\v "normale rexen
  set hlsearch
  set ignorecase
  set smartcase
  set incsearch
" easier search }}}

" gitgutter {{{
  let g:gitgutter_max_signs = 500  " default value
  let g:gitgutter_realtime=0
  let g:gitgutter_eager=0
  let g:gitgutter_diff_args='-w'
  let g:gitgutter_highlight_lines=0
  "let g:gitgutter_enabled = 0
" gitgutter }}}

" snipmate {{{
  let g:UltisnipsExpandTrigger="<c-tab>"
  let g:UltisnipsSnippetsDir="~/.vim/bundles_available/snippets/UltiSnips"

" snipmate }}}

" window stuff {{{
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  "map <C-S-h> <C-w>< " does not use shift yet, because vim does not
  "map <C-S-j> <C-w>+ " lets hope it will at some point
  "map <C-S-k> <C-w>- "
  "map <C-S-l> <C-w>> "
  let g:airline_powerline_fonts = 1
  "" }}}

  " Spell checking   {{{
  "if version >= 700
  "  hi clear SpellBad
  "  hi clear SpellCap
  "  hi clear SpellRare
  "  hi clear SpellLocal
  "  hi SpellBad    ctermfg=9
  "  hi SpellCap    ctermfg=3    cterm=underline
  "  hi SpellRare   ctermfg=13   cterm=underline
  "  hi SpellLocal  cterm=None
  "endif 
  "}}}

  " latex {{{
    let g:tex_flavor='latex'
  " latex }}}

  " sudo {{{
  cmap w!! w !sudo tee % >/dev/null 
  " sudo }}}

  " functinos {{{
    " Remove trailing whitespace
    " http://vim.wikia.com/wiki/Remove_unwanted_spaces
    function! StripTrailingWhitespace()
      if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<cr>
        normal `z
        retab
      endif
    endfunction

  " functions }}}
 
" Extensions }}}
