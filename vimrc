" Considerations
"
" - I'm using nvim now but the config works for both vim and nvim
"
" Userspace dependencies
" - par
" - rg
"
" Each new supported language should have configured the following features
" - Inline linting
" - default template for empty files
" - automatic ctags generation
" - documentation querying
" - simple repl setup
" - unit testing execution in single command
"
" DEBUG
" make vim more verobse, good for debugging
" set vbs=1

" plugins load {{{
filetype on
filetype plugin on "loading the plugin files for specific file types
call plug#begin()
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'altercation/vim-colors-solarized'
"inline errors, linting
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-utils/vim-man' "view manuals inside vim
" custom text objects
Plug 'kana/vim-textobj-user' "enable the creation of custom text objects
Plug 'kana/vim-textobj-function' "text object for a function: enables af and if
Plug 'michaeljsmith/vim-indent-object' "same identation text object
Plug 'vim-scripts/argtextobj.vim'
"gist support
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
"grep like sublime one
Plug 'dyng/ctrlsf.vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
"quoting/parenthesizing
Plug 'tpope/vim-surround'
"shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex', { 'for': ['latex'] }
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': ['php'] }
Plug 'vim-vdebug/vdebug', {'for': ['php'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'kballard/vim-swift', { 'for': ['swift'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
" visualizing marks
Plug 'kshenoy/vim-signature'
" this plugin is slow when the project is too big
"most recently used files list
Plug 'git@github.com:skywind3000/asyncrun.vim.git'
Plug 'junegunn/goyo.vim', { 'for': ['markdown'] }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'wakatime/vim-wakatime'
Plug 'benmills/vimux'
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'rhysd/devdocs.vim'
Plug 'tpope/vim-sleuth'
Plug 'breuckelen/vim-resize'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


call plug#end()
"}}}

"generic configs
set nocompatible
let mapleader = "\<space>"
runtime macros/matchit.vim "Enable extended % matching
set tags+=/usr/include/tags,./tags,./.git/tags,../.git/tags
" set mouse=a "enable mouse on normal,visual,inter,command-line modes
set backspace=indent,eol,start "make the backspace work like in most other programs

set splitright "split new windows to the right
" set cot+=menuone "Use the popup menu also when there is only one match
set number "show numbers
set relativenumber
set shell=$SHELL
set encoding=utf-8
set showmode "If in Insert, Replace or Visual mode put a message on the last line
set showcmd "Show (partial) command in the last line of the screen
set laststatus=2 "when the last window will have a status line: 2: always
set gdefault "When on, the :substitute flag 'g' is default on
" Show matching brackets when text indicator is over them
set showmatch
set scrolloff=0 " Minimum lines to keep above and below cursor"
set autoread "automaically read a file again when it's changed outside vim
set history=1000 "the quantity of normal commands recorded
set title "When on, the title of the window will be set to the value of 'titlestring'
" For regular expressions turn magic on
set magic
setlocal formatoptions=1
set formatprg=par "The name of an external program that will be used to format the lines selected with the |gq| operator.
" Move to word
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <Leader>em <Plug>(easymotion-overwin-w)
nmap , :

" insert filname in insert mode
inoremap ,fn <C-R>=expand("%:t:r")<CR>


" setlocal linebreak "wrap long lines at a character in 'breakat'
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard
    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif
let g:abolish_save_file = $HOME."/Dropbox/projects/vimrc/vim/abbreviations.vim"
set wildignore+=*\\dist\\**

nmap <leader>vn :vnew<cr>
nmap <leader>fim :!runFunction fileManager %:h<cr> command! FileManager execute "!runFunction fileManager %:h"
nnoremap <leader>on :only<cr>

"ale config {{{
nnoremap <leader>fmt :ALEFix<cr>
" autocmd FileType haskell map <Leader>fmt :!hfmt -w %:p<cr>
" autocmd FileType php map <Leader>fmt :!php-code-check %:p<cr>

let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 1
let g:ale_php_phpcs_standard = $CLIPP_PATH."/Backend/ruleset.xml"
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_writegood_options = ' --so --illusion --adverb --tooWordy --cliches'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'


let g:ale_linters = {
\   'php': ['php', 'phpcs'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'sh': ['shell', 'shellcheck'],
\   'markdown': ['write-good', 'proselint'],
\   'scala': ['fsc', 'scalac']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'php': ['php_cs_fixer', 'phpcbf'],
\   'python': ['autopep8', 'yapf'],
\   'scala': ['scalafmt']
\}

"}}}


" autocomplete {{{
" let g:ale_completion_enabled = 1
" set completeopt=longest,menuone
" set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
"}}}


" visual mode
"Allow using the repeat operator with a visual selection
vnoremap . :normal .<CR>



" search
set hlsearch " match while typing the search
set incsearch "show the next match while entering a search
set ignorecase "the case of normal letters is ignored
set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters

" fold {{{
func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)

    if l1 =~ '^\s*$'
        " ignore empty lines
        return '='
    endif

    let l2 = getline(a:lnum+1)

    if  l2 =~ '^==\+\s*'
        " next line is underlined (level 1)
        return '>1'
    elseif l2 =~ '^--\+\s*'
        " next line is underlined (level 2)
        return '>2'
    elseif l1 =~ '^#'
        " current line starts with hashes
        return '>'.matchend(l1, '^#\+')
    elseif a:lnum == 1
        " fold any 'preamble'
        return '>1'
    else
        " keep previous foldlevel
        return '='
    endif
endfunc

setlocal foldexpr=Foldexpr_markdown(v:lnum)

"enter fold giving a list of options on conflicts
nnoremap <C-]> g<C-]>

set foldcolumn=1
set foldenable!
"for most programming languages make sense to use indentation method to fold
autocmd FileType php,python,scala set foldmethod=indent

"enable fold for file greater than
autocmd FileType vim set foldmethod=marker
autocmd FileType markdown set foldmethod=expr
let g:MIN_LINES_TO_FOLD = 60
autocmd! BufReadPost * :if line('$') > MIN_LINES_TO_FOLD | setlocal foldenable foldlevel=1 | endif
"}}}

"Concealing {{{
" autocmd FileType php call matchadd('Conceal', '!=', 999, -1, {'conceal': '≠'})
" autocmd FileType php call matchadd('Conceal', '->', 999, -1, {'conceal': '➞'})
" autocmd FileType php call matchadd('Conceal', '=>', 999, -1, {'conceal': '➞'})
call matchadd('Conceal', '"', 999, -1, {'conceal': ''})
call matchadd('Conceal', "'", 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '# ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '## ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '### ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '#### ', 999, -1, {'conceal': ''})
autocmd FileType php call matchadd('Conceal', 'class ', 999, -1, {'conceal': ''})
autocmd FileType php call matchadd('Conceal', ';', 999, -1, {'conceal': ''})
autocmd FileType php call matchadd('Conceal', '\$', 999, -1, {'conceal': ''})
autocmd FileType php call matchadd('Conceal', 'function ', 999, -1, {'conceal': ''})


set conceallevel=2 "show pretty latex formulas
"}}}

" grep {{{
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
fun! Grepr( arg )
    execute "grep " . a:arg . " %:p:h/*"
endfun
command! -nargs=* Grepr call Grepr( '<args>' )
"}}}

"netrw
nnoremap <leader>k :Vexplore<cr>
let g:netrw_winsize = 25 "window width
let g:netrw_altv=1 "open vertical splits on the right
let g:netrw_liststyle=3
let g:netrw_winsize = 0

"spelling {{{
fun! FixLastSpellingError()
    normal! mm[s1z=`m
endfun
nnoremap <leader>fs :call FixLastSpellingError()<cr>
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
autocmd filetype rst set spell spelllang=en_us
autocmd filetype txt set spell spelllang=en_us
autocmd filetype markdown set spell spelllang=en_us
"}}}

" quick access {{{
let g:quickAccessFiles = {
\   "talks": $WIKI_PATH."/src/talks.md",
\   "snippet": $HOME."/.subsconfig.ini",
\   "productivity": $WIKI_PATH."/src/productivity.md",
\   "glossary": $WIKI_PATH."/src/glossary.md",
\   "sql": $HOME."/.getyourguide.sql",
\   "remember": $HOME."/.remember",
\   "quotes": $WIKI_PATH."/src/quotes.md",
\   "gyg": $WIKI_PATH."/src/gyg.md",
\}

fun! OpenQuickly(fname)
    let mfile = g:quickAccessFiles[a:fname]
    exec ':e '.mfile
endfun

command! -nargs=* Talk call OpenQuickly('talks')
map <Leader>sn :call OpenQuickly('snippet')<cr>
command! -nargs=* Productivity call OpenQuickly('productivity')
map <Leader>pro :call OpenQuickly('productivity')<cr>
command! -nargs=* Glossary call OpenQuickly('glossary')
map <Leader>go :call OpenQuickly('glossary')<cr>
command! -nargs=* Sql call OpenQuickly('sql')
nnoremap <leader>sql  :call OpenQuickly('sql')<cr>
command! -nargs=* Remember call OpenQuickly('remember')
command! -nargs=* Quotes call OpenQuickly('quotes')
nnoremap <leader>qo  :call OpenQuickly('quotes')<cr>
command! -nargs=* Gyg call OpenQuickly('gyg')
nnoremap <leader>gyg  :call OpenQuickly('gyg')<cr>

"Open files quickly
fun! LatestPost()
    let out =  system("run_function latestPost")
    execute 'edit' out
endfun
command! -nargs=* LatestPost call LatestPost()

"}}}

"Generic mappings
nnoremap <leader>gv  :! gvim %:p<cr>
nnoremap <leader>; :normal!mtA;<esc>`t
nnoremap <leader>: :normal!mtA:<esc>`t
nnoremap <leader>, :normal!mtA,<esc>`t
nnoremap <BS> :Rex<cr>
nnoremap + ddp
nnoremap _ dd2kp
nnoremap <Leader>le :noh<cr>
nnoremap <Leader>dt :r ! date<cr>



nnoremap cwi ciw
map <leader>i mmgg=G`m
map <leader>x :w<','> !bash<cr>
map <leader>me :!chmod +x %<cr>
nnoremap <leader>nt :tabnew<cr>
"open director (file manager)
nmap <leader>sh :!cd %:h && zsh <cr>
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <silent> <leader>ve :e $MY_VIMRC<cr>:lcd %:h<cr>
nnoremap <leader>c :noh<cr>
"set shellcmdflag=-ic "make vim :! behave like a normal prompt
nnoremap <leader><space> :w<cr>
"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
noremap <leader>qq :q!<cr>
cnoremap <C-n> <Down>
" use %% to expand to the current buffer directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>cf :!filefy-clippboard<cr>

"reload vim
if !exists('*ReloadVim')
    fun! ReloadVim()
        silent source $MY_VIMRC
        execute "edit %"
    endfun
    command! -nargs=* ReloadVim call ReloadVim()
    nmap <silent> <leader>vs :ReloadVim<cr>
endif


fun! RemoveFile()
    execute "!rm -rf %:p"
endfun
command! -nargs=* RemoveFile call RemoveFile()
noremap <silent> <leader>rmrf :RemoveFile<cr>

"performance
" {{{
set ttyfast "Improves smoothness of redrawing when there are multiple windows
" autocmd BufEnter * :syn sync maxlines=500
set lazyredraw "don't redraw screend when running macros
" syntax sync minlines=256

"disables syntax for files going over a certain size
" autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

set nocursorline "highlighting of the current line is a big deal for vim, probably the most important setting
" set synmaxcol=128
"}}}

"undo
" {{{
set undofile "enable undoing
set undodir=~/.vim/undo/
set undolevels=100
set undoreload=100
"}}}


" backup options
" {{{
set backup
set writebackup
set backupdir=~/.vim/backup
"don't clutter dirs with swp and tmpfiles
set swapfile
set directory=~/.vim/swap
"don't show alert message when the swap already exists
set shortmess+=A "don't give the "ATTENTION" message when an existing swap file is found
"}}}


"indenting {{{
filetype plugin indent on
set copyindent
set autoindent
"}}}

"custom text objects{{{
call textobj#user#plugin('line', {
            \   '-': {
            \     'select-a-function': 'CurrentLineA',
            \     'select-a': 'al',
            \     'select-i-function': 'CurrentLineI',
            \     'select-i': 'il',
            \   },
            \ })

fun! CurrentLineA()
    normal! 0
    let head_pos = getpos('.')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

fun! CurrentLineI()
    normal! ^
    let head_pos = getpos('.')
    normal! g_
    let tail_pos = getpos('.')
    let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
    return
                \ non_blank_char_exists_p
                \ ? ['v', head_pos, tail_pos]
                \ : 0
endfun

call textobj#user#plugin('bar', {
            \   '-': {
            \     'select-a-function': 'CurrentBarA',
            \     'select-a': "a\/",
            \     'select-i-function': 'CurrentBarI',
            \     'select-i': "i\/",
            \   },
            \ })

fun! CurrentBarA()
    normal! F/
    let head_pos = getpos('.')
    normal! f/
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun
fun! CurrentBarI()
    normal! T/
    let head_pos = getpos('.')
    normal! f/
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

call textobj#user#plugin('pipe', {
            \   '-': {
            \     'select-a-function': 'CurrentPipeA',
            \     'select-a': "a\\|",
            \     'select-i-function': 'CurrentPipeI',
            \     'select-i': "i\\|",
            \   },
            \ })

fun! CurrentPipeA()
    normal! F|
    let head_pos = getpos('.')
    normal! f|
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

fun! CurrentPipeI()
    normal! T|
    let head_pos = getpos('.')
    normal! f|
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

call textobj#user#plugin('datetime', {
            \   'date': {
            \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
            \     'select': ['ad', 'id'],
            \   },
            \ })

call textobj#user#plugin('document', {
            \   '-': {
            \     'select-a-function': 'CurrentDocumentA',
            \     'select-a': "a\*",
            \     'select-i-function': 'CurrentDocumentI',
            \     'select-i': "i\*",
            \   },
            \ })

fun! CurrentDocumentA()
    normal! gg
    let head_pos = getpos('.')
    normal! G$
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

fun! CurrentDocumentI()
    normal! ggj
    let head_pos = getpos('.')
    normal! G$k
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun
inoremap ;<cr> <end>;<cr>
"}}}

"actions over text blocks {{{

fun! s:DoAction(algorithm,type)
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
    let repl = s:{a:algorithm}(Chomp(@@))
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
endfun

fun! s:ActionOpfunc(type)
    return s:DoAction(s:encode_algorithm, a:type)
endfun

fun! s:ActionSetup(algorithm)
    let s:encode_algorithm = a:algorithm
    let &opfunc = matchstr(expand('<sfile>'), '<SNR>\d\+_').'ActionOpfunc'
endfun

fun! MapAction(algorithm, key)
    exe 'nnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>ActionSetup("'.a:algorithm.'")<CR>g@'
    exe 'xnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",visualmode())<CR>'
    exe 'nnoremap <silent> <Plug>actionsLine'.a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",v:count1)<CR>'
    exe 'nmap '.a:key.'  <Plug>actions'.a:algorithm
    exe 'xmap '.a:key.'  <Plug>actions'.a:algorithm
    exe 'nmap '.a:key.a:key[strlen(a:key)-1].' <Plug>actionsLine'.a:algorithm
endfun

" ctrlsf {{{

let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ackprg='rg'
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}

" let g:ctrlsf_mapping = {
"     \ "openb"    : ["<CR>", "o", "<2-LeftMouse>"],
"     \ "open"   : "O",
"     \ }

let g:ctrlsf_default_view_mode = 'compact'
" let g:ctrlsf_winsize = '30%'
" " or
" let g:ctrlsf_winsize = '100'

"find word under cursor
noremap <leader>fw :CtrlSF <C-r><C-w>

fun! s:FindIt(str)
    :AsyncRun ':CtrlSF "'.a:str.'"<cr>'
    return a:str;
endfun
call MapAction('FindIt','<leader>fit')

nnoremap <leader>fi :CtrlSF
fun! s:FindIt(str)
    :AsyncRun ':CtrlSF "'.a:str.'"<cr>'
    return a:str;
endfun
call MapAction('FindIt','<leader>fit')

fun! s:FindLocal(str)
    let path = expand('%:p:h')
    exec ':CtrlSF "'.a:str.'"  "'.path.'" <cr>'
    return a:str
endfun
call MapAction('FindLocal','<leader>fl')


function! FindStringWiki()
    let curline = getline('.')
    call inputsave()
    let name = input('Find on wiki: ')
    call inputrestore()
    execute ":CtrlSF ".name." ".$WIKI_PATH
endfunction

"}}}

fun! s:OnlyTextSelection(str)
    normal! ggVGx
    set noreadonly
    call append(0, split(Chomp(a:str), '\v\n'))
endfun
call MapAction('OnlyTextSelection','<leader>ts')


fun! s:ToSingleQuote(str)
    let out = system("tr '\"' \"'\"", a:str)
    return out
endfun
call MapAction('ToSingleQuote','<leader>tsq')

fun! s:ComputeMD5(str)
    let out = system('md5sum |cut -b 1-32', a:str)
    " Remove trailing newline.
    let out = substitute(out, '\n$', '', '')
    return out
endfun
call MapAction('ComputeMD5','<leader>md5')

function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfun

function! ChompedSystemCall( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfun

fun! s:ReverseString(str)
    let out = join(reverse(split(a:str, '\zs')), '')
    " Remove a trailing newline that reverse() moved to the front.
    let out = substitute(out, '^\n', '', '')
    return out
endfun
call MapAction('ReverseString', '<leader>i')

fun! s:StrikeThrough(str)
    return '~~'.a:str.'~~'
endfun
call MapAction('StrikeThrough', '<leader>st')


fun! s:MathBlock(str)
    return '$ '.a:str.' $'
endfun
call MapAction('MathBlock', '<leader>mb')

fun! s:Backtick(str)
    return "`".a:str."`"
endfun
call MapAction('Backtick', "<leader>`")

fun! s:Quote(str)
    return "'".a:str."'"
endfun
call MapAction('Quote', "<leader>'")

fun! s:DoubleQuote(str)
    return '"'.a:str.'"'
endfun
call MapAction('DoubleQuote', '<leader>"')

fun! s:Tag(str)
    return '<'.a:str.'>'
endfun
call MapAction('Tag', '<leader><')

fun! s:MakeList(str)
    let out = system('run_function prepend " - " ', a:str)
    return out
endfun
call MapAction('MakeList', '<leader>ml')

fun! s:Translate(str)
    let out = system('translate.sh ', a:str)
    return out
endfun
call MapAction('Translate', '<leader>le')

fun! s:TranslateGerman(str)
    let out = system('run_function translateGerman ', a:str)
    return out
endfun
call MapAction('TranslateGerman', '<leader>lg')

fun! s:EnglishToGerman(str)
    let out = system('translate.sh en de', a:str)
    return out
endfun
call MapAction('EnglishToGerman', '<leader>eg')

fun! s:MakeNumberedList(str)
    let out = system('echo "'.a:str.'" | nl -s". " -w1')
    return out
endfun
call MapAction('MakeNumberedList', '<leader>mnl')

fun! s:MakeGraph(str)
    let out = system('graph-easy', a:str)
    return a:str . "\n" . out
endfun
call MapAction('MakeGraph', '<leader>mg')

" special characters surrounding {{{
fun! s:Star(str)
    return '*'.a:str.'*'
endfun
call MapAction('Star', '<leader>*')

fun! s:Parenthesis(str)
    return '('.a:str.')'
endfun
call MapAction('Parenthesis', '<leader>(')

fun! s:Braces(str)
    return '{'.a:str.'}'
endfun
call MapAction('Braces', '<leader>{')

fun! s:Dollars(str)
    return '$'.a:str.'$'
endfun
call MapAction('Dollars', '<leader>$')

fun! s:Brackets(str)
    return '['.a:str.']'
endfun
call MapAction('Brackets', '<leader>[')
"}}}

fun! s:foldSomething(str)
    let comment=split(&commentstring, '%s')
    if len(l:comment)==1
        call add(comment, l:comment[0])
    endif
    return l:comment[0]." {{{\n".a:str."\n".l:comment[1]."}}}"
endfun
call MapAction('foldSomething', '<leader>fo')

fun! s:Trim(str)
    let out = system('run_function trim ', a:str)
    return out
endfun
call MapAction('Trim', '<leader>tr')

fun! s:googleIt(str)
    execute 'AsyncRun run_function googleIt "'.a:str.'"'
endfunc
call MapAction('googleIt', '<leader>gi')


fun! s:getHelp(str)
    let my_filetype = &filetype
    let out = system('getHelp.sh '.my_filetype, a:str)
endfunc
call MapAction('getHelp', '<leader>h')

"render a html chunk on the browser
fun! s:BCat(str)
    :'<,'>AsyncRun browser-cat
endfunc
call MapAction('BCat', '<leader>bc')

fun! s:Decode(str)
    let out = system('url-decode ', a:str)
    return out
endfunc
call MapAction('Decode', '<leader>d')

fun! s:ToCamelCase(str)
    let out = ChompedSystemCall('run_function toCamelCase', a:str)
    return out
endfunc
call MapAction('ToCamelCase', '<leader>tcc')

fun! s:ToSnakeCase(str)
    let out = ChompedSystemCall('run_function toSnakeCase', a:str)
    return out
endfunc
call MapAction('ToSnakeCase', '<leader>tcs')

fun! s:JsonBeautifier(str)
    let out = system('run_function json_beautifier ', a:str)
    return out
endfunc
call MapAction('JsonBeautifier', '<leader>jb')

fun! s:UrlToJson(str)
    let out = system('url-to-json ', a:str)
    return out
endfunc
call MapAction('UrlToJson', '<leader>ju')


fun! s:Alnum(str)
    let out = system('run_function alnum ', a:str)
    return out
endfunc
call MapAction('Alnum', '<leader>a')

fun! s:Unescape(str)
    let out = system('sed "s/\\\//g" ', a:str)
    return out
endfunc
call MapAction('Unescape', '<leader>u')


fun! s:SqlBeautifier(str)
    let out = system('run_function sql_format', a:str)
    return out
endfunc
call MapAction('SqlBeautifier', '<leader>sb')

call MapAction('XmlBeautifier', '<leader>x')
fun! s:XmlBeautifier(str)
    let out = system('run_function xml_beautifier ', a:str)
    return out
endfunc
call MapAction('XmlBeautifier', '<leader>xb')
"}}}

" markdown {{{

let g:vim_markdown_no_extensions_in_markdown = 1
autocmd Filetype markdown call MarkdownDefaultConfigs()
highlight Folded ctermfg=DarkYellow

fun! MarkdownDefaultConfigs()
    " set tw=80 "80 columns are more than enough
    set syntax=markdown
    set spell spelllang=en_us
endfunc

"this feature is from vim and it supports the latex syntax so look at the
"latex reference to know how to use it
let g:vim_markdown_math = 1
"syntax highlight for markdown
let g:vim_markdown_fenced_languages = [
    \'html',
    \'py=python',
    \'bash=sh',
    \'c',
    \'php=PHP',
    \'hs=haskell',
    \'elm',
    \'li=lisp'
\]

fun! UnderlineHeading(level)
    if a:level == 1
        normal! I# 
    elseif a:level == 2
        normal! I## 
    elseif a:level == 3
        normal! I### 
    elseif a:level == 4
        normal! I#### 
    elseif a:level == 5
        normal! I##### 
    endif
endfunc

nnoremap <leader>h1 :call UnderlineHeading(1)<cr>
nnoremap <leader>h2 :call UnderlineHeading(2)<cr>
nnoremap <leader>h3 :call UnderlineHeading(3)<cr>
nnoremap <leader>h4 :call UnderlineHeading(4)<cr>
nnoremap <leader>h5 :call UnderlineHeading(5)<cr>

function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunc
fun! s:Italic(str)
    return '*'.a:str.'*'
endfunc
call MapAction('Italic', '<leader>it')

fun! s:Bold(str)
    return '**'.a:str.'**'
endfunc
call MapAction('Bold', '<leader>bo')

fun! s:Highlight(str)
    return '***'."\n".a:str.'***'
endfunc
call MapAction('Highlight', '<leader>hl')

fun! s:CodeBlock(str)
    return "```sh\n".a:str."\n```"
endfunc
call MapAction('CodeBlock', '<leader>c')
"}}}

fun! s:Repl(str)
    :VimuxRunCommand(a:str."\n")
endfunc
call MapAction('Repl', '<leader>ev')

nmap <Leader>els :VimuxRunCommand("\n")<CR>
nmap <Leader>el :VimuxRunLastCommand<CR>

fun! s:Subs(str)
    let my_filetype = &filetype
    let out = ChompedSystemCall('subs -p '.my_filetype, a:str."\n")
    return out
endfunc
call MapAction('Subs', '<leader>o')


" diary {{{
fun! Diary( arg )
    let out = system('run_function diary_file "' . a:arg . '"')
    execute "edit " . out
endfunc

command! -nargs=* Today call Diary( 'today' )
command! -nargs=* Someday call Diary( 'someday' )
command! -nargs=* Diary call Diary( '<args>' )
command! -nargs=* Diary call Diary( '<args>' )
nnoremap <Leader>now :Today<cr>
command! -nargs=* Tomorrow call Diary( 'tomorrow' )
command! -nargs=* Yesterday call Diary( 'yesterday' )
nnoremap <Leader>ye :Yesterday<cr>
command! -nargs=* Today call Diary( 'today' )
command! -nargs=* Someday call Diary( 'someday' )
command! -nargs=* Diary call Diary( '<args>' )
command! -nargs=* NextRetrospective call Diary( 'next monday' )

fun! WeekSummary()
    let out = system('run_function weekly_summary_file')
    execute "edit " . out
endfunc
command! -nargs=* WeekSummary call WeekSummary()
map <Leader>ws :call WeekSummary()<cr>

fun! GrepDiary( arg )
    let old_path = $pwd
    exec "cd " . $DIARY_PATH
    execute "grep " . a:arg . "  "
    exec "cd ". old_path
endfunc
command! -nargs=* GrepDiary call GrepDiary( '<args>' )
command! -nargs=* DiaryGrep call GrepDiary( '<args>' )

fun! BottomDiary( arg )
    let out = system("run_function diary_file " . a:arg )
    execute "split" . out
    res 10
endfunc
command! -nargs=* BottomDiary call BottomDiary( '<args>' )
"}}}

" wiki {{{
map <c-i> :FZF $WIKI_PATH/src<cr>
let g:vim_markdown_no_default_key_mappings = 1
fun! Wiki(arg)
    let wiki_path = "$WIKI_PATH/src"
    "sets the current directory of the window localy to enable file searches
    execute "lcd " . wiki_path
    execute "edit " . wiki_path . "/index.md"
endfunc
command! -nargs=* Wiki call Wiki( '<args>' )
command! -nargs=* Quote :e $WIKI_PATH/src/quotes.md

nnoremap <Leader>ww :Wiki<cr>
nnoremap <Leader>ww :Wiki<cr>

fun! GetUrl()
    normal! $F(vi("cy
    return @c
endfunc
fun! GetLine()
    normal! "cyy
    return @c
endfunc

fun! OpenMarkdown()
    let url = GetUrl()
    let path = expand('%:p:h')
    execute 'edit ' . path . '/' . url . '.md'
endfunc

fun! OpenFile()
    let line = GetLine()
    if ( line =~ "^http" )
        let url = GetUrl()
        :call OpenUrl(url)
        return
    elseif ( line =~ ".png" )
        let url = GetUrl()
        execute "!run_alias image ".url. " & "
        return
    endif

    if ( line != "\n" )
        :call OpenMarkdown()
    endif
endfun
autocmd FileType markdown nnoremap <CR> :call OpenFile()<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

fun! OpenUrl(url)
    silent execute '! open "' . a:url . '" 1>/dev/null  &'
endfunc
nnoremap gx :call OpenUrl()<cr>

fun! GrepWiki( arg )
    let old_path = $pwd
    exec "cd " . $WIKI_PATH
    execute "grep " . a:arg . "  "
    exec "cd ". old_path
endfunc
command! -nargs=* GrepWiki call GrepWiki( '<args>' )
command! -nargs=* WikiGrep call GrepWiki( '<args>' )
"}}}


" templates for filetypes {{{
autocmd BufNewFile *.php 0r $TEMPLATES_DIR/php.php
autocmd BufNewFile *.sh 0r $TEMPLATES_DIR/shell.sh
autocmd BufNewFile *.hs 0r $TEMPLATES_DIR/haskell.hs
autocmd BufNewFile *.html 0r $TEMPLATES_DIR/html.html
autocmd BufNewFile *.elm 0r $TEMPLATES_DIR/elm.elm
autocmd BufNewFile *.c 0r $TEMPLATES_DIR/c.c
autocmd BufNewFile **/papers/*.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile **/*_paper.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile **/*review*.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile */diary/*.md 0r $TEMPLATES_DIR/diary.md
autocmd BufNewFile */posts/*.md 0r $TEMPLATES_DIR/post.md
"}}}

" generic actions relative to current file
nmap <leader>xo :!xdg-open % &<cr>
"copy path name
nmap <leader>cpn :!mycopy %:p<cr>
"copy only name
nmap <leader>con :!mycopy %:t<cr>
"copy full name
nmap <leader>cfn :!mycopy %:p<cr>
"copy the current directoy
nmap <leader>ccd :!mycopy %:p:h<cr>
nmap <leader>cdn :!mycopy %:p:h<cr>
nmap <leader>ccp :!mycopy %:p:h<cr>
nmap <leader>cdcd :cd %:p:h<cr>

fun! SaveForcing()
    execute "w !sudo tee > /dev/null %"
endfunc
command! -nargs=* ForceSave call SaveForcing()
command! -nargs=* SaveForce call SaveForcing()

nmap <leader>crn :call CopyCurrentRelativePath()<cr>
fun! CopyCurrentRelativePath()
    let path = RelativePath(expand("%:p"))
    let result = system('mycopy ', path)
endfunc
fun! RelativePath(filename)
    let cwd = getcwd()
    let s = substitute(a:filename, l:cwd . "/" , "", "")
    return s
endfunc

fun! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunc
map <Leader>rn :call RenameFile()<cr>

fun! CopyFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        redraw!
    endif
endfunc
map <Leader>cp :call CopyFile()<cr>

"git {{{
fun! GitLog()
    let path = expand('%:p')
    let cmd='cd $(dirname '.path.') ; git log -p --follow '.path
    :execute 'vnew | 0read ! '.cmd
    :set syntax=git
    :normal gg
endfunc
nmap <leader>gk :call GitLog()<cr>

fun! GitDiff()
    let path = resolve(expand('%:p'))
    execute '!cd $(dirname '.path.') ; git diff '.path.' '
endfunc
nmap <leader>gdf :call GitDiff()<cr>
"}}}

map <leader>rl :edit!<cr>
map <leader>ed :edit!<cr>
map <leader>ee :edit!<cr>
map <leader>ck :!git checkout %<cr>
map <leader>gck :!git checkout %<cr>
fun! Blame(arg)
    let current_line = line(".") + 1
    let file_name = expand('%')
    let out = system('git blame '.file_name.' > /tmp/blame')
    execute "vsplit +".current_line." /tmp/blame"
endfunc
command! -nargs=* Blame call Blame( '<args>' )

fun! CheckoutFile(arg)
    let file_name = expand('%')
    execute '!git checkout ' . file_name
    execute 'edit!'
endfunc
command! -nargs=* CheckoutFile call CheckoutFile( '<args>' )

fun! OpenRepoOnGithub(arg)
    let repo = system('git remote -v | cut -d ":" -f2 | cut -d "." -f1 | head -n 1')
    let url = "https://github.com/" . repo . ".git"
    let result = system("open " . url . " & ")
endfunc
command! -nargs=* GithubRepo call OpenRepoOnGithub( '<args>' )


"PHP {{{
fun! s:JsonEncode(str)
    let out = system('json_encode_from_php', a:str)
    return out
endfunc
call MapAction('JsonEncode', '<leader>pj')

fun! s:JsonToPhp(str)
    let out = system('json-to-php ', a:str)
    return out
endfun
call MapAction('JsonToPhp', '<leader>jp')
"}}}
function SessionDirectory() abort
    if len(argv()) > 0
        return fnamemodify(argv()[0], ':p:h')
    endif
    return getcwd()
endfunction

" gvim {{{ 
:set guioptions+=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ Book\ 13
endif
"}}}
" C lang
fun! CFiletypeConfigs()
    "compile through gcc when there's no makefile
    if !filereadable(expand("%:p:h")."/Makefile")
        setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
    endif
endfun
autocmd filetype c call CFiletypeConfigs()

"theme, colors, highlights
syntax enable
augroup VimrcColors
    au!
    autocmd ColorScheme * highlight WordsToAvoid ctermfg=DarkBlue cterm=underline
    autocmd ColorScheme * highlight HardWords ctermfg=DarkBlue cterm=underline
    autocmd ColorScheme * highlight Whitespace ctermbg=Grey
    autocmd ColorScheme * highlight Overlength ctermbg=DarkGrey
    autocmd ColorScheme * highlight SpellBad ctermfg=Brown
    "makes a underline on the current cursor line
augroup END

autocmd Syntax * call matchadd('WordsToAvoid', '\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|little\|quite\|everyone\knows\|however\|easy\|obviamente\|basicamente\|simplesmente\|com\certeza\|claramente\|apenas\|mais\|todos\sabem\|entretanto\|então\|fácil\|bem\)\>')
"words that need to be revised
autocmd Syntax * call matchadd('HardWords', '\c\<\(porquê\|porque\|por\sque\|its\)\>')
autocmd Syntax * call matchadd('Whitespace', '\s\+$')
autocmd Syntax * call matchadd('Overlength', '\%81v')

let g:solarized_termtrans = 1
let g:airline_theme='solarized'
" set background=light
set background=dark

if has('nvim')
    " Neovim specific commands
else
    "not nvim commands
    set term=screen-256color
endif

colorscheme solarized
let g:solarized_bold=1
set t_Co=256
" color 0 is the dark background and 15 is the light one
hi StatusLine ctermfg=12 ctermbg=0 cterm=NONE


" vimrc per project
set exrc "enable vimrc per project
set secure "disable unsecure options


" windows
function! ToggleWindowHorizontalVerticalSplit()
    if !exists('t:splitType')
        let t:splitType = 'vertical'
    endif
    if t:splitType == 'vertical' " is vertical switch to horizontal
        windo wincmd K
        let t:splitType = 'horizontal'

    else " is horizontal switch to vertical
        windo wincmd H
        let t:splitType = 'vertical'
    endif
endfun
nnoremap <silent> <leader>wt :call ToggleWindowHorizontalVerticalSplit()<cr>


" writer mode
let writer_mode=$WRITER_MODE
fun! WritingMode()
    :Goyo
endfun
command! -nargs=* WritingMode call WritingMode()
map <Leader>wm :call WritingMode()<cr>

" star search over any kind of text
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>


" search
nnoremap <leader>wf :call FindStringWiki()<cr>
"search on open files lines
function! s:buffer_lines()
    let res = []
    for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
        call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
    endfor
    return res
endfunction

function! s:searchLineHandler(l)
    let keys = split(a:l, ':\t')
    exec 'buf' keys[0]
    exec keys[1]
    normal! ^zz
endfunction


au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar set filetype=zip

let g:VimuxHeight = "20"


" to PDF
fun! s:PdfFile(str)
    echom "Starting to create pdf"
    let fileName = expand("%:p")
    let out = system('md2pdf.sh '.fileName)
    if v:shell_error
        call ShowStringOnNewWindow(out)
    endif
endfunc
call MapAction('PdfFile', '<leader>pdf')

fun! WeekReport()
    echom "Generating report"
    let out = system('journalReport.sh & ')
    if v:shell_error
        call ShowStringOnNewWindow(out)
    endif
endfun
command! -nargs=* WeekReport call WeekReport()
map <Leader>wr :call WeekReport()<cr>

"

" elm {{{
let g:elm_format_autosave = 0
let g:elm_make_show_warnings = 0
let g:elm_detailed_complete = 0
autocmd FileType elm map <Leader>fmt :ElmFormat<cr>
"}}}


nnoremap <leader>pd :call PhpDoc()<cr>
set hidden "hides buffers instead of closing them, don't give warnings on unsaved things

"fzf {{{
let g:fzf_buffers_jump = 1
" let g:fzf_layout = { 'window': 'split enew' }
map <c-p> :FZF<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>ls :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>


nnoremap <leader>mru :FZFMru<cr>
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

"}}}
autocmd BufNewFile,BufRead *.es6 set filetype=javascript

autocmd filetype crontab setlocal nobackup nowritebackup



fun! s:GenerateTags(str)
    let directory = input('Directory: ', getcwd() )
    let out = system('ctags -R '.directory)
    if v:shell_error
        call ShowStringOnNewWindow(out)
    endif
endfunc
call MapAction('GenerateTags', '<leader>tt')

fun! TmuxContent()
    if !exists("g:VimuxRunnerIndex") || _VimuxHasRunner(g:VimuxRunnerIndex) == -1
        call VimuxOpenRunner()
    endif

    let idx = g:VimuxRunnerIndex
    let out = system('tmux capture-pane -J -p -t '.idx.' > /tmp/tmux')
    :vsplit /tmp/tmux
endfunc
nnoremap <leader>ec :call TmuxContent()<cr>
nnoremap <leader>eh :call TmuxContent()<cr>

let g:vdebug_keymap = {
\    "run" : "<leader>dr",
\    "run_to_cursor" : "<leader>du",
\    "step_over" : "<leader>dd",
\    "step_into" : "<leader>di",
\    "step_out" : "<leader>do",
\    "close" : "<leader>de",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<leader>db",
\    "get_context" : "dx",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>dv",
\}

" save the previous cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async =  1
let g:easytags_autorecurse = 0

fun! ShowStringOnNewWindow(content)
    split _output_
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(a:content, '\v\n'))
endfun

fun! NotifySend(content)
    :Asyncrun notify-send '".a:content."'"
endfun

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
noremap <silent> <leader>tn :TestNearest<CR> " t Ctrl+n
noremap <silent> <leader>tf :TestFile<CR>    " t Ctrl+f
noremap <silent> <leader>ts :TestSuite<CR>   " t Ctrl+s
noremap <silent> <leader>tl :TestLast<CR>    " t Ctrl+l
noremap <silent> <leader>tg :TestVisit<CR>   " t Ctrl+g
let test#strategy = "vimux"

"docummentation {{{
fun! Documentation(str)

    if (&filetype == 'scala')
        let url = 'https://www.scala-lang.org/api/current/?search='.a:str
        let out = system("open '" . url . "' ")
        return
    endif

    execute ":DevDocsAll ".a:str
endfunc

fun! s:Dit(str)
    call Documentation(a:str)
endfunc

nmap <leader>dcw  "zyiw:exe "call Documentation('".@z."')"<cr>
call MapAction('Dit', '<leader>dci')
"}}}

" window resize {{{
let g:resize_count = 12
let g:vim_resize_disable_auto_mappings = 1
nnoremap <leader>H :CmdResizeLeft<cr>
nnoremap <leader>L :CmdResizeRight<cr>
nnoremap <leader>K :CmdResizeUp<cr>
nnoremap <leader>J :CmdResizeDown<cr>
nnoremap <leader>= <C-w>=
"}}}
