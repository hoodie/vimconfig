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
    if (has("gui_running") || &t_Co > 2) " pick your any color you like as well as fonts
      " GUI SETTINGS {{{
      "" Menu
      " 'a' autoselect ( for copy and pasting )
      " 'c'	Use console dialogs instead of popup dialogs for simple choices.
      " 'm'	Menu bar is present.
      " 't'	Include tearoff menu items.  Currently only works for Win32, GTK+, and Motif 1.2 GUI.
      " 'h'	Limit horizontal scrollbar size to the length of the cursor line.  Reduces computations. |gui-horiz-scroll|
      " 'r'	Right Scrollbar
      set guioptions=chat " ace, mace, Tace, Tacet
      set mousehide " hide pointer during typing
      " GUI SETTINGS }}}

      "BRIGHT Colors:  summerfruit256, martin_krischik
      "DARK Colors:    Monokai, jellybeans, lucius, molokai_original, mustang, eddie
      "Known Fonts:    Monospace, FreeMono, DejaVu\ Sans\ Mono, Droid\ Sans\ Mono

      "set guifont=Hack\ 8 " see vimrc.local
      colorscheme maui
      "colorscheme Tomorrow-Night



      set t_Co=256
      set mouse=a

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
  let g:tagbar_left=0
  let g:tagbar_sort=0
" TAGBAR }}}

" SETTINGS }}}

" SHORTCUTS {{{
  let mapleader=','
  let g:python_highlight_all = 1

  autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
  nnoremap <F5> :GundoToggle<CR>

  "nmap <F8> :TagbarToggle<CR>
  nmap <F8> :cwindow<CR>
  noremap cn :cnext<CR>
  noremap cp :cprevious<CR>
  nmap <S-F8> :make -j3<CR>
  "au Filetype cpp,ruby,python,java nnoremap <silent><buffer> <F9> :TlistToggle<CR>
  "au Filetype cpp,ruby,python,java nnoremap <silent><buffer> <S-F9> :TlistUpdate<CR>
  au Filetype cpp,ruby,python,rust,java,javascript nnoremap <silent><buffer> <F10> :TagbarToggle<CR>
  "autocmd BufWritePost *.py call Flake8()
  "au Filetype rust TagbarToggle

  au Filetype pandoc nnoremap <silent><buffer> <F10> :TOC<CR>
  au Filetype pandoc setl foldcolumn=0 number nofoldenable
  let g:pandoc#toc#close_after_navigating=0
  "let g:pandoc#toc#position = "left"

  au Filetype cpp,c nmap <S-F8> :make -j3<CR>

  " Quickfix Switching
  nnoremap [q :cprev<CR>
  nnoremap ]q :cnext<CR>
  nnoremap [Q :cfirst<CR>
  nnoremap ]Q :clast<CR>

  " Tab Switching
  nnoremap <Tab> <C-W>w
  nnoremap <S-Tab> <C-W>W
  nnoremap <C-Tab> gt
  nnoremap <C-S-Tab> gT
  nnoremap <C-T> :tabe .<CR>
  nnoremap <C-S> :vs .<CR>
  nnoremap <C-P> :tabe ~/.vim/vimrc.local<CR>

  map <F9> :NERDTreeToggle<CR>
  map <F11> :set fullscreen!<CR>
  noremap <silent><Leader>/ :nohls<CR>

  " open some url/path
  set isfname+=32
  noremap ,o :execute ":!xdg-open " . shellescape( '<cfile>' )<CR>

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
  au Filetype cpp setl shiftwidth=4 tabstop=4 foldmethod=marker expandtab smarttab foldmarker={,} nofoldenable
  au Filetype cpp map <F4> :FSHere <CR>
  au Filetype cpp map <F7> :copen <CR>
  au Filetype cpp map <F8> :make -j4 <CR>
" cpp }}}

" rust {{{
  let g:rustfmt_autosave = 1
  au Filetype rust setl foldmethod=indent nofoldenable foldtext=GetCustomFoldText() shiftwidth=4 tabstop=5 softtabstop=2
   let g:tagbar_type_rust = {
       \ 'ctagstype' : 'rust',
       \ 'kinds' : [
           \'T:types,type definitions',
           \'g:enum,enumeration names',
           \'s:structure names',
           \'c:consts,static constants',
           \'t:traits,traits',
           \'i:impls,trait implementations:1',
           \'m:modules,module names',
           \'f:functions,function definitions',
       \],
       \'sro': '.',
       \ 'kind2scope' : {
       \},
       \ 'scope2kind' : {
       \ }
       \}
" rust }}}

  au Filetype ruby   setl foldmethod=indent nofoldenable
  au Filetype python setl foldmethod=indent nofoldenable
  au Filetype python setl shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au Filetype yaml   setl foldmethod=indent foldenable
  au Filetype vim    setl foldmethod=marker foldenable shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  "au Filetype rust   setl foldmethod=marker foldmarker={,} nofoldenable foldtext=GetCustomFoldText()
  au Filetype pandoc setl nofoldenable

  au Filetype javascript setl shiftwidth=4 tabstop=4 smarttab foldmethod=marker foldmarker={,} nofoldenable

  "au BufRead,BufNewFile .vimrc,vimrc  set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  "au BufRead,BufNewFile *.css         set shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  "au BufRead,BufNewFile *.js,*.java   set shiftwidth=2 tabstop=4 smarttab expandtab softtabstop=4
  au BufRead,BufNewFile *.coffee      setl shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au BufNewFile,BufReadPost *.coffee  setl foldmethod=indent foldenable

  function GetCustomFoldText()
    let foldClose = '}'
    let foldTtl = v:foldend - v:foldstart
    return getline(v:foldstart) . ' (+) ' . foldTtl .  ' lines... ' . foldClose
  endfunction

" FILETYPES }}}

" Extensions {{{
" nerdtree {{{
 let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.lock$']
" nerdtree }}}

" rust {{{
 set hidden
 let g:racer_cmd = "racer"
 let $RUST_SRC_PATH="/usr/src/rust/src/"
" rust }}}

" navigation {{{
  inoremap jj <ESC>
  inoremap kk <ESC>
  set wildmenu
  set wildmode=longest,list:longest
  nnoremap k gk
  nnoremap j gj
  " navigation }}}

" easier search {{{
  "nnoremap / /\v
  "vnoremap / /\v "normale rexen
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
  "let g:airline#extensions#tabline#enabled = 0
  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'

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

" Load Machine Local Settings{{{

runtime! vimrc.local

" }}}
