"Mappings  noremap \ ,
filetype on
filetype plugin on
syntax enable
let mapleader = "\<space>"
set grepprg=ag
autocmd filetype php set formatoptions+=t
runtime macros/matchit.vim
set tags=./tags,./.git/tags,../.git/tags
" this harder to deploy normal commands with this setting
" set relativenumber
"vim will treat all numerals as decimals, useful on num<C-a> with numbers like 007
set nrformats=
set splitbelow
setlocal nospell
set completeopt=menu
set backspace=indent,eol,start
set cot+=menuone
set noswapfile
set nobackup
set nowritebackup
set number
set shell=/bin/bash
set encoding=utf-8
set showmode
set showcmd
"use the bnext and cnext without a trailing bang
set hidden
set wildmenu "to autocomplete the suggestions like bash
set wildmode=longest,list
"set wildmenu
"set wildmode=full
set ttyfast
set ruler
set laststatus=2
set undodir=/home/jean/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
set hlsearch
" match while typing the search
set incsearch
set ignorecase
set smartcase
set copyindent
set autoindent
set gdefault
set guifont=Fira\ Code:h12

"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar
set lazyredraw

"indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
" set softtabstop=4
set expandtab
" set shiftround
set guiheadroom=0
"set antialias
"set runtimepath+=/home/jean/.vim/snippets
"show matching parenthesis
set showmatch
set scrolloff=3                 " Minimum lines to keep above and below cursor"
set autoread
set foldenable
" set smarttab
"the quantity of normal commands recorded
set history=1000
set title
" set visualbell
" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
set cursorline
" if exists("g:ctrl_user_command")
"       unlet g:ctrlp_user_command
" endif
set wildignore=*.swp,*.back,*.pyc,*.class,*.coverage.*,*\\vendor\\*
set backupdir=~/.tmp
set directory=~/.tmp "don't clutter dirs with swp and tmpfiles
set lazyredraw "don't redraw screend when running macros
highlight StatusLine ctermfg=blue ctermbg=yellow
" Display extra whitespace
set list listchars=tab:»·,trail:·

setlocal formatoptions=1
set complete+=s
set formatprg=par
setlocal linebreak
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:abolish_save_file = '/home/jean/.vim/abbreviations.vim'
"set clipboard=unnamedplus
set clipboard=unnamed
"improve sytax highlight performance {{{
syntax sync minlines=256
set nocursorcolumn
set nocursorline
"set relativenumber
autocmd BufEnter * :syn sync maxlines=500
set synmaxcol=200
"}}}
autocmd FileType markdown set commentstring=<!!--\ %s\ -->
autocmd FileType markdown set syntax=markdown
"CTRLP with regex by default
" let g:ctrlp_regexp = 0
":nnoremap <Space> @q
"disable search continuation on edges
"set nowrapscan
"no octal
"performance tweaks
"au FileType php setl ofu=phpcomplete#CompletePHP
" au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
" au FileType c setl ofu=ccomplete#CompleteCpp
" au FileType css setl ofu=csscomplete#CompleteCSS
au FileType markdown setl tw=66
au Filetype markdown setl formatoptions+=t
au FileType TEX setl tw=66
" set list listchars=tab:\ \ ,trail:•
set shortmess+=I
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" highlight OverLength ctermbg=red ctermfg=white guibg=#666666
" match OverLength /\%81v.\+/
"turn the 120 chars column to red
" set colorcolumn=120

"gvim options
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=L  "remove left-hand scroll bar
set nocompatible
hi MatchParen cterm=none ctermbg=black ctermfg=yellow
" Make it more obviouser when lines are too long
highlight ColorColumn ctermbg=235


" let theme=$THEME
set background=dark
" if theme == 'light'
"     set background=light
" else
"     set background=dark
" endif
" set background=dark

set foldmethod=marker
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM


"Plugins
call plug#begin()

" Plug 'bkad/CamelCaseMotion'
" Plug 'vim-scripts/Align' | Plug 'vim-scripts/SQLUtilities'
"Plug '2072/PHP-Indenting-for-VIm'
"Plug 'Shougo/neocomplcache'
"Plug 'Shougo/vimproc'
"Plug 'Shougo/vimshell'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets', { 'for': [ 'php'] }
"Plug 'Townk/vim-autoclose'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'airblade/vim-gitgutter'
"Plug 'ajh17/VimCompletesMe'
"Plug 'andreimaxim/vim-io', { 'for': [ 'io'] }
"Plug 'chrisbra/BufTimer'
"Plug 'coot/vim_args'
"Plug 'derekwyatt/vim-scala', { 'for': [ 'scala'] }
"Plug 'ervandew/supertab'
"Plug 'gcmt/taboo.vim'
"Plug 'gisraptor/vim-lilypond-integrator'
"Plug 'godlygeek/tabular'
"Plug 'https://github.com/Shougo/unite.vim.git' " Unite and create user interfaces
"Plug 'jiangmiao/auto-pairs'
"Plug 'joonty/vdebug'
"Plug 'kien/ctrlp.vim'
"Plug 'lervag/vimtex', { 'for': ['latex'] }
"Plug 'luochen1990/rainbow', { 'for': [ 'php'] }
"Plug 'm2mdas/phpcomplete-extended', { 'for': [ 'php'] }
"Plug 'maksimr/vim-translator', { 'for': [ 'md', 'txt'] }
"Plug 'mattn/emmet-vim'
"Plug 'mattn/vim-metarw-gdrive'
"Plug 'mhinz/vim-startify'
"Plug 'mileszs/ack.vim'
"Plug 'mtth/scratch.vim'
"Plug 'pangloss/vim-javascript', { 'for': [ 'javascript'] }
"Plug 'plasticboy/vim-markdown'
"Plug 'rayburgemeestre/phpfolding.vim', { 'for': [ 'php' ] }
"Plug 'rust-lang/rust.vim', { 'for': [ 'rust'] }
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-endwise' add end in ruby
"Plug 'tpope/vim-fugitive' git tools
"Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-rsi'
"Plug 'vim-scripts/closetag.vim', { 'for': [ 'html'] }
"Plug 'vim-scripts/marvim'
"Plug 'vim-scripts/textutil.vim'
"Plug 'wincent/Command-T'
"redline style integration
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': [ 'php'] }
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/calendar.vim'
Plug 'jez/vim-superman'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': [ 'ruby'] }
Plug 'vim-scripts/Mark--Karkat'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vimwiki/vimwiki'
Plug 'wakatime/vim-wakatime'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }



call plug#end()

" let g:rainbow_conf = {
" \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" \   'ctermfgs': ['Blue', 'Magenta', 'DarkGreen', 'DarkYellow'],
" \}

"Marks 
" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
runtime plugin/mark.vim
silent MarkClear


" let g:rustfmt_autosave = 1 

"bad words
Mark /\cobviously\|basically\|simply\|of\ scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
Mark /\obviamente\|basicamente\|simplesmente\|com\ certeza\|claramente\|apenas\|mais\|todos\sabem\|entretanto\|então,\|fácil\|bem/

"mark duplicated words and excedent whitespaces
" highlight WrongPatterns ctermbg=red guibg=red
" autocmd InsertEnter * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
" autocmd InsertLeave * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
" autocmd BufWinEnter * match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
" match WrongPatterns /\w\s\{2,\}\w\|\s\+$\|\v<(\w+)\_s+\1>/
" autocmd BufWinLeave * call clearmatches()
"end mark text errors"

" let marvim_store = '/home/jean/projects/vimrc/vim/marvim' 
" let marvim_find_key = '<leader>mf' " change find key from <F2> to 'space' 
" let marvim_store_key = '<leader>ms'     " change store key from <F3> to 'ms' 
"let marvim_register = 'c'       " change used register from 'q' to 'c' 
"let marvim_prefix = 0           " disable default syntax based prefix 

"let g:ackprg = 'ag --vimgrep --smart-case'
"cnoreabbrev ag Ack
"cnoreabbrev aG Ack
"cnoreabbrev Ag Ack
"cnoreabbrev AG Ack

"let g:unite_redraw_hold_candidates=50000
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <leader>/ :Unite grep:.<cr>
"nnoremap <leader>b :Unite -quick-match buffer<cr>
"call unite#custom#profile('context.ignorecase', 'context.ignorecase', 1)
"call unite#custom#source('file_rec/async', 'ignore_pattern', 'vendor/')

"snippets
augroup load_us
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips')
augroup END

" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType.= "<c-x><c-o>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:netrw_localrmdir='rm -r'
"put line numbers on netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_liststyle=3
"let g:netrw_list_hide= '^\.'
let g:netrw_hide = 0

" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let &runtimepath.=',/home/jean/.vim/plugin/ns9tks-vim-l9-3bb534a720fa'
let &runtimepath.=',/home/jean/.vim/plugin/ns9tks-vim-autocomplpop-13fe3d806464'
" let g:ctrlp_max_files=0
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
"       let g:ctrlp_user_command = 'ag %s -U -l --nocolor -g ""'
" endif
"let NERDTreeMouseMode=3
" let NERDTreeDirArrows=0
"let NERDTreeMinimalUI=1
" let NERDTreeShowLineNumbers=1


"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

"colorscheme
colorscheme solarized
"set t_Co=16
"let g:solarized_termcolors=16

"makes a underline on the current cursor line
:hi CursorLine cterm=underline ctermbg=NONE
:hi clear SpellBad
:hi SpellBad cterm=bold ctermbg=red

nnoremap <BS> :Rex<cr>
nnoremap <Leader>fs :w ! sudo tee %<cr>
nnoremap <Leader>q :q<cr>
" nnoremap <Leader>p :set paste!<cr>
nnoremap <Leader>dt :r ! date<cr>
nnoremap <Leader>e :edit!<cr>
nnoremap <Leader>o :only<cr>
nnoremap cwi ciw
" inoremap <C-z> <Esc>[s1z=gi
map - ddp
map _ dd2kp
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
map <leader>i mmgg=G`m
map <leader>x :w<','> !bash<cr>
" map <leader>bt :call ToggleBackgroundColour()<cr>
map <leader>me :!chmod +x %<cr>
nnoremap <leader>tn :tabnew<cr>
map <leader>gp :!chmod 777 %<cr>
map <leader>mk :!cd %% ; make<cr>
map <leader>ck :!git checkout %<cr>
nmap <leader>of :!xdg-open % &<cr>
"open director (file manager)
nmap <leader>od :!thunar %:h<cr>
nmap <leader>rmrf :!rm -rf %:p <cr>
" nmap <leader>k :NERDTreeToggle<cr>
nmap <leader>k :Explore<cr>
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <leader>cfn :!copy %:p<cr>
nmap <leader>c <C-w>v<C-w>l<cr> :VimShell<cr>
nmap <leader>t :TagbarToggle<cr>
nmap <leader>gk :!gitk %<cr>
nmap <leader>dw \(\<\w\+\>\)\_s*\<\1\><cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
" nmap <silent> <leader>sn :e /home/jean/projects/snippet/vim/UltiSnips/php.snippets<cr>
" nmap <silent> <leader>snc :e /home/jean/projects/snippet/vim/UltiSnips/php_clipp.snippets<cr>
nnoremap <leader>c :noh<cr>
" nnoremap <leader>cc :CtrlPClearAllCaches<cr>
nnoremap <leader><space> :w<cr>

"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cmap w!! w !sudo tee > /dev/null %
" use %% to expand to the current buffer directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let g:vimwiki_list = [
            \ {'path': '~/projects/writing/', 'syntax': 'markdown', 'ext': '.md' },
            \ {'path': '~/projects/compufacil/Docs/', 'syntax': 'markdown', 'ext': '.md'}]

let g:airline_theme='solarized'


command Phpcsfixer : ! php-code-check `pwd`/%
    \ || print "Error on code check" && sleep 10

function! RunPHPUnitTest(filter)
    cd %:p:h
    if a:filter

        normal! T yw
        if @" =~ "^test*"
            normal! mT
        endif

        normal! `T

        normal! T yw
        "
        let myCommand="phpunit -c ". $PWD ."/Backend/phpunit.xml.dist --filter " . @" . " " . expand("%:p")
        let result = system(myCommand)
    else
        let @n = expand('%:t') 
        if @n =~ "Test"
            normal! mA
        endif
        normal! `A


        let myCommand = "phpunit -c ". $PWD . "/Backend/phpunit.xml.dist " . expand("%:p")
        let result = system(myCommand)
    endif
    split __PHPUnit_Result__
    normal! ggdG
    setlocal buftype=nofile
    call append(0, myCommand)
    call append(0, split(result, '\v\n'))
    cd -
endfunction

"command Phpmystandard : ! printf "PHP my standard \n" && make-php `pwd`/%
autocmd filetype php nnoremap <leader>s :Phpcsfixer<cr>
"autocmd filetype php nnoremap <leader>m :Phpmystandard<cr>
nnoremap <leader>u :call RunPHPUnitTest(0)<cr>
nnoremap <leader>f :call RunPHPUnitTest(1)<cr>

com! FormatJSON %!python -m json.tool
au BufNewFile *.html 0r /home/jean/projects/dotfiles/snippet/template/html.html
au BufNewFile *.php 0r /home/jean/projects/dotfiles/snippet/template/php.php
au BufNewFile *.c 0r /home/jean/projects/dotfiles/snippet/template/c.c
"template for articles and science papers review
au BufNewFile *review.md 0r /home/jean/projects/dotfiles/snippet/template/science-review.md
au BufNewFile */natural-computing/*.md 0r /home/jean/projects/dotfiles/snippet/template/science-review.md
au BufNewFile */diary/*.md 0r /home/jean/projects/dotfiles/snippet/template/diary.md
au BufNewFile */posts/*.md 0r /home/jean/projects/dotfiles/snippet/template/post.md

function! OnlineDoc()
  if &ft =~ "cpp"
    let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
  elseif &ft =~ "ruby"
    let s:urlTemplate = "https://www.google.com.br/?q=ruby+%"
  elseif &ft =~ "php"
    let s:urlTemplate = "http://php.net/manual-lookup.php?pattern=%&scope=quickref"
  elseif &ft =~ "perl"
    let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
  else
    return
  endif
  let s:browser = "browser"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "silent !" . s:browser . " " . s:url . "&"
  execute s:cmd
  redraw!
endfunction
" Online doc search.
map <Leader>doc :call OnlineDoc()<cr>
map <silent> <M-d> :call OnlineDoc()<cr>

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nmap <C-W>u :call MergeTabs()<CR>


function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>

function! CopyFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    redraw!
  endif
endfunction
map <Leader>cp :call CopyFile()<cr>


function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
let @r=';.'

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

map <c-p> :FZF<cr>

" fix the last spelling error
" nnoremap <leader>sp :normal! mm[s1z=`m<cr>
function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction

nnoremap <leader>ls :call FixLastSpellingError()<cr>

function! MoveEm(position)
    let saved_cursor = getpos(".")
    let previous_blank_line = search('^$', 'bn')
    let target_line = previous_blank_line + a:position - 1
    execute 'move ' . target_line
    call setpos('.', saved_cursor)
endfunction

for position in range(1, 9)
    execute 'nnoremap m' . position . ' :call MoveEm(' . position . ')<cr>'
endfor

function UnderlineHeading(level)
    if a:level == 1
        normal! yypVr=
    elseif a:level == 2
        normal! yypVr-
    elseif a:level == 3
        normal! I### 
    elseif a:level == 4
        normal! I#### 
    elseif a:level == 5
        normal! I##### 
    endif
endfunction

nnoremap <leader>h1 :call UnderlineHeading(1)<cr>
nnoremap <leader>h2 :call UnderlineHeading(2)<cr>
nnoremap <leader>h3 :call UnderlineHeading(3)<cr>
nnoremap <leader>h4 :call UnderlineHeading(4)<cr>
nnoremap <leader>h5 :call UnderlineHeading(5)<cr>

function! MoveUseOfTraitsToBody()
    normal! mL
    normal gg/^use.*\(Helper\|Trait\)dd/    useP>>wi\V:s/ as .*;/;/e$hviw*ddgg:w:bd
    normal! `L
endfunction

nnoremap <leader>ttb :call MoveUseOfTraitsToBody()<cr>


call textobj#user#plugin('datetime', {
\   'date': {
\     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
\     'select': ['ad', 'id'],
\   },
\ })

call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction

nnoremap <leader>cf :!filefy-clippboard<cr>


function UseClassKeywordInsteadOfString()
    normal! $F's::classF's\
endfunction

nnoremap <leader>uc  :call UseClassKeywordInsteadOfString()<cr>

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" Adapted from unimpaired.vim by Tim Pope.
function! s:DoAction(algorithm,type)
  " backup settings that we will change
  let sel_save = &selection
  let cb_save = &clipboard
  " make selection and clipboard work the way we need
  set selection=inclusive clipboard-=unnamed clipboard-=unnamedplus
  " backup the unnamed register, which we will be yanking into
  let reg_save = @@
  " yank the relevant text, and also set the visual selection (which will be reused if the text
  " needs to be replaced)
  if a:type =~ '^\d\+$'
    " if type is a number, then select that many lines
    silent exe 'normal! V'.a:type.'$y'
  elseif a:type =~ '^.$'
    " if type is 'v', 'V', or '<C-V>' (i.e. 0x16) then reselect the visual region
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    " line-based text motion
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    " block-based text motion
    silent exe "normal! `[\<C-V>`]y"
  else
    " char-based text motion
    silent exe "normal! `[v`]y"
  endif
  " call the user-defined function, passing it the contents of the unnamed register
  let repl = s:{a:algorithm}(@@)
  " if the function returned a value, then replace the text
  if type(repl) == 1
    " put the replacement text into the unnamed register, and also set it to be a
    " characterwise, linewise, or blockwise selection, based upon the selection type of the
    " yank we did above
    call setreg('@', repl, getregtype('@'))
    " relect the visual region and paste
    normal! gvp
  endif
  " restore saved settings and register value
  let @@ = reg_save
  let &selection = sel_save
  let &clipboard = cb_save
endfunction

function! s:ActionOpfunc(type)
  return s:DoAction(s:encode_algorithm, a:type)
endfunction

function! s:ActionSetup(algorithm)
  let s:encode_algorithm = a:algorithm
  let &opfunc = matchstr(expand('<sfile>'), '<SNR>\d\+_').'ActionOpfunc'
endfunction

function! MapAction(algorithm, key)
  exe 'nnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>ActionSetup("'.a:algorithm.'")<CR>g@'
  exe 'xnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",visualmode())<CR>'
  exe 'nnoremap <silent> <Plug>actionsLine'.a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",v:count1)<CR>'
  exe 'nmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'xmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'nmap '.a:key.a:key[strlen(a:key)-1].' <Plug>actionsLine'.a:algorithm
endfunction

" function! s:OpenUrl(str)
"   silent execute "!firefox ".shellescape(a:str, 1)
"   redraw!
" endfunction
" call MapAction('OpenUrl','<leader>u')

function! s:ComputeMD5(str)
  let out = system('md5sum |cut -b 1-32', a:str)
  " Remove trailing newline.
  let out = substitute(out, '\n$', '', '')
  return out
endfunction
call MapAction('ComputeMD5','<leader>M')

function! s:ReverseString(str)
  let out = join(reverse(split(a:str, '\zs')), '')
  " Remove a trailing newline that reverse() moved to the front.
  let out = substitute(out, '^\n', '', '')
  return out
endfunction
call MapAction('ReverseString', '<leader>i')

function! s:Bold(str)
    return '*'.a:str.'*'
endfunction
call MapAction('Bold', '<leader>b')

function! s:CodeBlock(str)
    return "```\n".a:str."\n```"
endfunction
call MapAction('CodeBlock', '<leader>c')

function! s:Filefy(str)
  let out = system('filefy ', a:str)
  return out
endfunction
call MapAction('Filefy', '<leader>y')

function! s:preRun(str)
    return "$(".a:str.")"
endfunction
call MapAction('preRun', '<leader>p')

function! s:Trim(str)
  let out = system('trim ', a:str)
  return out
endfunction
call MapAction('Trim', '<leader>t')


function! s:Decode(str)
  let out = system('url-decode ', a:str)
  return out
endfunction
call MapAction('Decode', '<leader>d')


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

