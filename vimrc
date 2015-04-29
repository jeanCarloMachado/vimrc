set nocompatible

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
"Plug 'junegunn/vim-easy-align'
"Plug 'exvim/main'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
"Plug 'joonty/vdebug'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'wakatime/vim-wakatime'
"Plug 'mattn/emmet-vim'
Plug 'ajh17/VimCompletesMe'
"Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
"Plug 'vim-scripts/textutil.vim'

augroup load_us
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips')
augroup END

call plug#end()

filetype plugin indent on

let mapleader = ","
filetype on
syntax enable

set t_Co=16
set background=dark
colorscheme solarized

"no octal
set nrformats=
set nofoldenable
set completeopt=menu
set backspace=indent,eol,start
set cot+=menuone
set noswapfile
set nobackup
set number
set wrap
set wrapscan
set shell=/bin/bash
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
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
set undolevels=1000
set wildignore=*.swp,*.back,*.pyc,*.class
set title
set visualbell
set cursorline

"performance tweaks
set nocursorcolumn
set norelativenumber
set synmaxcol=120
syntax sync minlines=256

"Cntrlp fast
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let NERDTreeMouseMode=3
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1


:nnoremap <Space> @q
map <Esc><Esc> :w <CR>
map <F7> mzgg=G`z<CR>
map <leader>spt :set spell spelllang=pt_br<CR>
map <leader>sen :set spell spelllang=en_us<CR>
map <leader>b :call ToggleBackgroundColour()<CR>
nmap <leader>k :NERDTreeToggle<CR>
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
noremap ; :
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
noremap k gk
cmap w!! w !sudo tee % >/dev/null

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd filetype php nnoremap <leader>cs :Phpcsfixer<cr>


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

function ToggleBackgroundColour ()
    if (&background == 'light')
        set background=dark
        echo "background -> dark"
    else
        set background=light
        echo "background -> light"
    endif
endfunction

command Preview :!firefox %<CR>
command Phpcsfixer : ! printf "Linter \n" && php -l `pwd`/% &&  printf "Csfixer \n" && php-cs-fixer fix `pwd`/% && printf "Beutifier \n" && phpcbf `pwd`/% --standard=PSR2

command Date :r !date

command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

