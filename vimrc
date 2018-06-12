"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
set history=100
set nocompatible " no compatibility to venerable old vi
set autoread     " set to auto read when a file is changed from the outside
set backspace=2  " make backspace work in insert mode
set laststatus=2 " display the status line always

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
set fileencoding=utf-8  
set encoding=utf-8  
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on       " enable syntax highlighting
set number      " display line numbers on the left
set report=0    " display the count of lines yanked or deleted on the status line 
set ruler       " display current position on the status line
set cursorline  " cursor line highlight
set showmatch   " highlight the matching bracket 
set wildmenu    " better command-line completion
set confirm     " prompts if there are unsaved changes

set iskeyword+=_,$,@,%,#,- 
set whichwrap+=<,>,h,l
set viminfo='20,\"50
set clipboard+=unnamed " copy to system clipboard

" search
set hlsearch    " highlight search results
set incsearch   " makes search act like search in modern browsers
set ignorecase  " use case insensitive search, except when using capital letters
set smartcase

" indent & tab
set autoindent    " copy indent from current line for new line
set expandtab     " enter spaces when tab is pressed
set tabstop=4     " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4  " number of spaces to use for auto indent

" backup
set backup	
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.

" ctags
set tags=./tags;,tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM setting with specific filetypes 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
au BufNewFile,BufRead *.json setfiletype javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setfiletype markdown

au Filetype html,css setlocal et ts=2 sw=2
au Filetype html,css EmmetInstall 
au Filetype javascript setlocal et ts=4 sw=4 sts=0
au FileType python setlocal et sta sw=4 sts=4 cc=120 foldmethod=indent
au! BufNewFile,BufRead * setlocal nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'              " Let Vundle manage Vundle, required

" Code/Project navigation
Plugin 'scrooloose/nerdtree'               " A Tree explorer plugin for navigating the filesystem
Plugin 'majutsushi/tagbar'                 " List table of function/variable like IDE
Plugin 'ctrlpvim/ctrlp.vim'                " Fuzzy file, buffer, mru, tag, etc finder

" Tool
Plugin 'itchyny/lightline.vim'             " A statusline plugin for vim
Plugin 'milkypostman/vim-togglelist.git'   " Bind a key to toggle the Location List (\l) and the Quickfix List (\q)
Plugin 'Lokaltog/vim-easymotion'           " Easy motion (\w)
Plugin 'gorodinskiy/vim-coloresque'        " Color preview for vim

" TextMate-style snippets
Plugin 'MarcWeber/vim-addon-mw-utils'      " dependencies #1
Plugin 'tomtom/tlib_vim'                   " dependencies #2
Plugin 'honza/vim-snippets'                " Snippets repo
Plugin 'SirVer/ultisnips'                  " Snippets manager

" Develop
Plugin 'vim-syntastic/syntastic'           " A syntax checking plugin for Vim
Plugin 'maralla/completor.vim'             " Auto Complete Code
Plugin 'cjrh/vim-conda'                    " Change conda environments in the Vim editor
Plugin 'mattn/emmet-vim'                   " Zen coding (html, css)
Plugin 'davidhalter/jedi-vim'              " Python

" Git
Plugin 'tpope/vim-fugitive.git'            " Git commands
Plugin 'airblade/vim-gitgutter'            " Show git diff sign
Plugin 'junegunn/gv.vim'                   " Commit browser with GV command

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let g:NERDTreeWinSize=25
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" EasyMotion
let g:EasyMotion_leader_key = '\'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E402 --max-line-length=120"

" completor 
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

" UltiSnips
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" emmet.vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-L>'

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.git/*
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>, :CtrlP<cr>

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'tr'
let g:ctrlp_open_multiple_files = 'tr'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|node_modules)$',
    \ 'file': '\v\.(so|pyc|swp|zip|DS_Store)$',
    \ }
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor 
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_use_caching = 0
endif

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'condaenv'],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'condaenv': 'LightlineConda',
     \ },
      \ }
function! LightlineConda()
  return ($CONDA_DEFAULT_ENV != '') ? $CONDA_DEFAULT_ENV : 'default'
endfunction

" GitGutter
let g:gitgutter_highlight_lines = 1
highlight clear SignColumn
 highlight GitGutterAdd ctermfg=green
 highlight GitGutterChange ctermfg=yellow
 highlight GitGutterDelete ctermfg=red
 highlight GitGutterChangeDelete ctermfg=yellow


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" compile key
au FileType java nmap <F8> :w !javac "%:p" && java -cp "%:p:h" "%:t:r"<CR> 
au FileType c nmap <F8> :w !gcc --o "%:p:r.out" "%:p" && "%:p:r.out"
au FileType cpp nmap <F8> :w !g++ --o "%:p:r.out" "%:p" && "%:p:r.out"
au FileType python map <buffer> <F8> <ESC>:w<CR>:!python %<CR>

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
map <F5> :CondaChangeEnv<CR>
map <F9> :w<CR>:call Debug()<CR>

noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

nmap <silent> [g :<C-U> :GitGutterLineHighlightsToggle<CR>
nmap <silent> [h :<C-U> :lprev<CR>
nmap <silent> ]h :<C-U> :lnext<CR>

nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

map g1 :tabn 1<CR>
map g2 :tabn 2<CR>
map g3 :tabn 3<CR>
map g4 :tabn 4<CR>
map g5 :tabn 5<CR>
map gc :tabnew<CR>
map gn :tabn<CR>
map gp :tabp<CR>

" Debug
func Debug()
exec "w" 
  if &filetype == 'c' 
    exec "!rm %<"
    exec "!gcc % -g -o %<"
    exec "!gdb %<"
  elseif &filetype == 'cpp'
    exec "!rm %<"
    exec "!g++ % -g -o %<"
    exec "!gdb %<"
    exec "!rm %<.class"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!jdb %<"
  elseif &filetype == 'python'
    exec "!pdb %"
  endif
endfunc
