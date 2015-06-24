set nocompatible

"Plug 'vim-scripts/textutil.vim'
set wrap

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ervandew/supertab'
"Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-abolish'
"Plug 'joonty/vdebug'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'wakatime/vim-wakatime'
"Plug 'mattn/emmet-vim'
Plug 'ajh17/VimCompletesMe'
"Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
Plug 'nelstrom/vim-visual-star-search'
"Plug 'https://JeanCarloMachado@bitbucket.org/ns9tks/vim-autocomplpop'
Plug 'ssh://hg@bitbucket.org/ns9tks/vim-autocomplpop'
Plug 'https://bitbucket.org/ns9tks/vim-autocomplpop/'
"Plug 'vim-scripts/textutil.vim'
"Plug 'https://github.com/Shougo/unite.vim.git'
"Plug 'Shougo/neocomplcache'
"Plug 'Shougo/vimproc'
"Plug 'Shougo/vimshell'
"Plug '2072/PHP-Indenting-for-VIm'

:ab teh the
:ab JavaS JavaScript
:ab javas JavaScript
:ab Javas JavaScript
:ab yaw You are welcome
:ab paramter parameter
:ab reuslt result
:ab resutl result

augroup load_us
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips')
augroup END

call plug#end()

filetype plugin indent on
autocmd filetype php set tw=72
autocmd filetype php set formatoptions+=t
set clipboard=unnamedplus

runtime macros/matchit.vim

let mapleader = ","
noremap \ ,
filetype on
syntax enable

set t_Co=16

let theme=$THEME
set background=dark
if theme == 'light'
    set background=light
else
    set background=dark
endif

":autocmd ColorScheme * highlight WrongPatterns ctermbg=red guibg=red

colorscheme solarized

set tags=./tags,./.git/tags,../.git/tags

"disable search continuation on edges
"set nowrapscan
"no octal
set nrformats=
set spell
set nofoldenable
set completeopt=menu
set backspace=indent,eol,start
set cot+=menuone
set noswapfile
set nobackup
set number
set shell=/bin/bash
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest,list
set ttyfast
set ruler
set laststatus=2
set undofile
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoindent
set copyindent
set gdefault
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab
set guiheadroom=0
set antialias
set runtimepath+=/home/jean/.vim/snippets
set mouse=a
set showmatch
set autoread
set smarttab
set history=1000
set undolevels=66666
set title
set visualbell
set cursorline
set wildignore=*.swp,*.back,*.pyc,*.class,*.coverage.*
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/_reports/*

let &runtimepath.=',/home/jean/.vim/plugin/ns9tks-vim-l9-3bb534a720fa'
let &runtimepath.=',/home/jean/.vim/plugin/ns9tks-vim-autocomplpop-13fe3d806464'
"performance tweaks
set nocursorcolumn
set norelativenumber
"set synmaxcol=120
syntax sync minlines=256
autocmd FileType markdown set commentstring=<!!--\ %s\ -->

let g:ctrlp_max_files=0
let NERDTreeMouseMode=3
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1

"CTRLP with regex by default
let g:ctrlp_regexp = 1
":nnoremap <Space> @q

map <leader>spt :set spell spelllang=pt_br<CR>
map <leader>sen :set spell spelllang=en_us<CR>
map <leader>b :call ToggleBackgroundColour()<CR>
nmap <leader>k :NERDTreeToggle<CR>
nmap <leader>c <C-w>v<C-w>l<CR> :VimShell<CR>
nmap <leader>t :TagbarToggle<CR>
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P
nmap <leader>s <Plug>(easymotion-s)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
nmap <silent> <leader>sn :e /home/jean/projects/snippet/vim/UltiSnips/php.snippets<cr>
nmap <silent> <leader>snc :e /home/jean/projects/snippet/vim/UltiSnips/php_clipp.snippets<cr>
omap t <Plug>(easymotion-bd-tl)

nnoremap <leader><space> :noh<cr>
inoremap jj <ESC> "Important!"
cmap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"mark duplicated words and excedent whitespaces
"highlight WrongPatterns ctermbg=red guibg=red
"autocmd InsertEnter * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
"autocmd InsertLeave * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
"autocmd BufWinEnter * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
"match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
"autocmd BufWinLeave * call clearmatches()
"end mark text errors

command Phpcsfixer : ! printf "Linter \n" && php -l `pwd`/% 
    \ && printf "Csfixer \n" && php-cs-fixer fix `pwd`/% 
    \ && printf "Beutifier \n" && phpcbf `pwd`/% --standard=PSR2

command Phpmystandard : ! printf "PHP my standard \n" && make-php `pwd`/%
autocmd filetype php nnoremap <leader>cs :Phpcsfixer<cr> :Phpmystandard<cr>
autocmd filetype php nnoremap <leader>m :Phpmystandard<cr>
command BlogSaveContent : ! printf "Saving post online" blog-post-update-content %:t:r %

":setlocal makeprg=make-php `pwd`/%

function ToggleBackgroundColour ()
    if (&background == 'light')
        set background=dark
    else
        set background=light
    endif
endfunction

function! s:Scratch (command, ...)
   redir => lines
   let saveMore = &more
   set nomore
   execute a:command
   redir END
   let &more = saveMore
   call feedkeys("\<cr>")
   new | setlocal buftype=nofile bufhidden=hide noswapfile
   put=lines
   if a:0 > 0
      execute 'vglobal/'.a:1.'/delete'
   endif
   if a:command == 'scriptnames'
      %substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##e
   endif
   silent %substitute/\%^\_s*\n\|\_s*\%$
   let height = line('$') + 3
   execute 'normal! z'.height."\<cr>"
   0
endfunction

command! -nargs=? Scriptnames call <sid>Scratch('scriptnames', <f-args>)
command! -nargs=+ Scratch call <sid>Scratch(<f-args>)

filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

