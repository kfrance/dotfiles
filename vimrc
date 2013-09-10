autocmd!
syntax on
set mouse=a
map <F2> :w<CR>
set incsearch
set tabstop=4
set shiftwidth=4
set number
set ignorecase " This has to be set for smartcase to work
set smartcase
set lbr "word wraps on word rather than characters
filetype plugin indent on
set vb t_vb= " turn off audible bell


" To show tabs and spaces you can use this command: set list listchars=tab:»·,trail:·

"Turn spell check on and off with <F7> and change highlighting
:map <F7> :setlocal spell! spelllang=en_us<cr>
highlight SpellBad ctermfg=red ctermbg=NONE cterm=underline,bold
highlight SpellCap ctermfg=NONE ctermbg=NONE cterm=underline,bold
highlight SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline,bold
highlight SpellRare ctermfg=cyan ctermbg=NONE cterm=underline,bold

" Extra Highlighting for python
highlight pythonNumber ctermfg=green ctermbg=NONE cterm=NONE
highlight pythonFloat ctermfg=magenta ctermbg=NONE cterm=NONE

"Load the correct syntax and indenting for matlab files
autocmd BufNewFile,BufRead *.m set filetype=matlab

" Load syntax for scons
autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead SConscript set filetype=python

" Go to same line last time I edited the file
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

"Draw line at character 80 on the screen
autocmd BufNewFile,BufRead *.cpp,*.c,*.h,*.py,*.pl set cc=80

" Fix status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Turn off toolbar and menu by default
set guioptions-=m
set guioptions-=T

" Insert a new line without entering insert mode
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" Special mappings for html
au BufNewFile,BufRead *.html,*.htm imap ;jb <div class=entry><cr><h2 class=date><ESC>"=strftime("%A %B %d, %Y")<CR>pa</h2><cr></div><ESC><up>o<p></p><ESC>F<i
au BufNewFile,BufRead *.html,*.htm inoremap ;ul <ul><cr><li></li><cr></ul><up><ESC>f>a
au BufNewFile,BufRead *.html,*.htm inoremap ;ol <ol><cr><li></li><cr></ol><up><ESC>f>a
au BufNewFile,BufRead *.html,*.htm inoremap ;li <li></li><ESC>F<i
au BufNewFile,BufRead *.html,*.htm inoremap ;sa <a href="../scriptures/" target="_blank"></a><ESC>F<i

" Special mappings for latex
au BufEnter *.tex imap ;mb $\left[\begin{matrix}<cr><tab>
au BufEnter *.tex imap ;me <cr><bs>\end{matrix}\right]$<cr>
au BufEnter *.tex imap ;db \begin{description}<cr><tab>\item[]<cr><left>\end{description}<up><ESC>0f]i 
au BufEnter *.tex imap ;eb \begin{enumerate}<cr><tab>\item<cr><left>\end{enumerate}<up><ESC>$a 
au BufEnter *.tex imap ;ib \begin{itemize}<cr><tab>\item<cr><left>\end{itemize}<up><ESC>$a 
au BufEnter *.tex imap ;fb \begin{frame}<cr><tab>\frametitle{}<cr><left>\end{frame}<up><ESC>f}i
au BufEnter *.tex set noautoindent

" set syntax for cu files to c
au BufNewFile,BufRead *.cu set filetype=c

" set filetype for viki files
let g:vikiNameSuffix=".viki"
let g:vikiNoIndent="blah"
au BufRead,BufNewFile *.viki set ft=viki
au BufRead,BufNewFile *.viki set tw=72
au BufRead,BufNewFile *.viki set fo=tqaw
au BufRead,BufNewFile *.viki set noet
au BufRead,BufNewFile *.viki set autoindent
au BufRead,BufNewFile *.viki imap <F3> <c-v>u2023
au BufRead,BufNewFile *.viki imap <F2> <c-v>u2022
au BufRead,BufNewFile *.viki imap <F4> <c-v>u2218
au BufRead,BufNewFile *.viki set guifont=Monospace\ 14

" Map movement keys to do visual movements
noremap j gj
noremap k gk

" Automatic insert matching braces
au BufNewFile,BufRead *.c,*.cpp,*.h,*.go inoremap {{ {<cr>}<esc><up>o
set complete=.,w,b,u,t

" Don't pop up help menu when hitting <F1>
map <F1> :"Nothing"<CR>

" Cpp omni complete stuff
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/opencv_tags
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,preview
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Turn on persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" show last line in file
set display=lastline

" set color schome so you don't have hard to read lines in terminal
colorscheme desert

" Set type of freecad macros to python
au BufNewFile,BufRead *.FCMacro set filetype=python

" set syntax for pde files to arduino
au BufNewFile,BufRead *.pde set filetype=arduino

" Add pathogen stuff
execute pathogen#infect()

let g:snips_trigger_key="<c-j>"
