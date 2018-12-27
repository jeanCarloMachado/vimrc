"Considerations
"
" - 1% of the configs here are nvim only
"
" Userspace dependencies
" - par
" - rg
"- ctags https://github.com/universal-ctags/ctags
" - yaourt -S python-proselint write-good

" Each new supported language should have configured the following features
" - linters and fixer
" - default template for empty files
" - check if ctags support works, otherwise add
" - documentation querying on devdocs otherwiser add exception
" - simple repl setup
" - unit testing execution in single command

" plugins load {{{
set nocompatible
filetype on
filetype plugin on "loading the plugin files for specific file types
call plug#begin()
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'altercation/vim-colors-solarized'
"inline errors, linting
Plug 'w0rp/ale', { 'for': ['php', 'python', 'ruby', 'markdown', 'sh', 'scala', 'javascript', 'elm'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-user' "enable the creation of custom text objects
"same indentation text object
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'
"gist support
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
"grep like sublime one
Plug 'dyng/ctrlsf.vim'
"quoting/parenthesizing
Plug 'tpope/vim-surround'
"shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" visualizing marks
Plug 'kshenoy/vim-signature'
" this plugin is slow when the project is too big
"most recently used files list
Plug 'git@github.com:skywind3000/asyncrun.vim.git'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'wakatime/vim-wakatime'
Plug 'benmills/vimux'
"better tags management
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test', { 'for': ['php', 'python', 'ruby'] }
Plug 'rhysd/devdocs.vim'
"adjust indenting
Plug 'tpope/vim-sleuth'
"seeing git log and git diff
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'majutsushi/tagbar'
"autocomplete
Plug 'jeanCarloMachado/vim-toop'
"autocomplete pairs chars
Plug 'raimondi/delimitmate'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
"easily go back to project root
Plug 'dbakker/vim-projectroot'
Plug 'vim-syntastic/syntastic', { 'for': ['swift'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex', { 'for': ['latex'] }
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins', 'for': ['scala'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': ['php'] }
Plug 'vim-vdebug/vdebug', {'for': ['php'] }
"filetype only * (for swift)
Plug 'keith/swift.vim'
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
"hides links paths, and other small niceties
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'junegunn/goyo.vim', { 'for': ['markdown'] }
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"requires nvim-completion-manager
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Include Phpactor

Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'


call plug#end()
"}}}

let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git', '.hg', '.svn', '.bzr','_darcs','build.xml']


" {{{ generic
set wildignore+=*\\dist\\**
let mapleader = "\<space>"
" set mouse=a "enable mouse on normal,visual,inter,command-line modes
set backspace=indent,eol,start "make the backspace work like in most other programs
" set cot+=menuone "Use the popup menu also when there is only one match
set number "show numbers
set hidden "hides buffers instead of closing them, don't give warnings on unsaved things
set shell=/bin/bash
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
set magic " For regular expressions turn magic on
setlocal formatoptions=1
set formatprg=par "The name of an external program that will be used to format the lines selected with the |gq| operator.
" vimrc per project
set exrc "enable vimrc per project
" set secure "disable unsecure options
" Move to word
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard
    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif
runtime macros/matchit.vim "Enable extended % matching
"}}}

"Generic mappings{{{
"Allow using the repeat operator with a visual selection
vnoremap . :normal .<CR>
nnoremap <BS> :Rex<cr>
nnoremap + ddp
nnoremap _ dd2kp
nnoremap <Leader>le :noh<cr>
nnoremap <Leader>dt :r ! date<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>
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
" set shellcmdflag=-ic "make vim :! behave like a normal prompt
nnoremap <leader><space> :w<cr>
"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
noremap <leader>qq :q!<cr>
cnoremap <C-n> <Down>
" use %% to expand to the current buffer directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>cf :!filefy-clippboard<cr>
nmap <Leader>em <Plug>(easymotion-overwin-w)
nmap <Leader>ff <Plug>(easymotion-overwin-w)
"fast normal mode access through , instead of :
nmap , :
"make appending this punctuation chars easy
nnoremap <leader>; :normal!mtA;<esc>`t
nnoremap <leader>: :normal!mtA:<esc>`t
nnoremap <leader>, :normal!mtA,<esc>`t
" plugin specific
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:abolish_save_file = "/home/jean/.vim/after/plugin/abolish.vim"
nnoremap <leader>cr :ProjectRootCD<cr>
"}}}

"linting, fixing - ale config {{{
let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm']
nnoremap <leader>fmt :ALEFix<cr>


let g:ale_set_highlights = 1

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_writegood_options = ' --so --illusion --adverb --tooWordy --cliches'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'

"change ruleset for fishfamr
autocmd BufRead,BufNewFile */fishfarm/* let g:ale_php_phpcs_standard = "/home/jean/projects/activity-classifier/ruleset.xml"

let g:ale_linters = {
\   'php': ['php', 'phpcs'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'sh': ['shell', 'shellcheck'],
\   'markdown': ['write-good', 'proselint'],
\   'scala': ['fsc', 'scalac'],
\   'swift': ['swiftlint'],
\   'elm': ['elm-fomart', 'elm-make']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'php': ['php_cs_fixer', 'phpcbf'],
\   'python': ['autopep8', 'yapf'],
\   'scala': ['scalafmt'],
\   'swift': ['swiftformat'],
\   'elm': ['elm-format']
\}
"}}}

" autocomplete {{{
" let g:ale_completion_enabled = 1
" set completeopt=longest,menuone
" set omnifunc=syntaxcomplete#Complete
"}}}

"Concealing {{{
autocmd FileType markdown call matchadd('Conceal', '# ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', '## ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', '### ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', '#### ', 999, -1, {'conceal': ''})

" autocmd FileType swift call matchadd('Conceal', "{\\n", 999, -1, {'conceal': ''}) |
"     \ call matchadd('Conceal', "}\\n", 999, -1, {'conceal': ''})


autocmd FileType php call matchadd('Conceal', '"', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', "'", 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'class ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', ';', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', '\$', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'function ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'public ', 999, -1, {'conceal': ''})

set conceallevel=2 "show pretty latex formulas
let g:conceal_php_disable_ligature=1
"}}}

"{{{ grep
set grepprg=rg\ --vimgrep\ --hidden\ --no-ignore 
set grepformat=%f:%l:%c:%m
fun! Grepr( arg )
    execute "grep " . a:arg . " %:p:h/*"
endfun
command! -nargs=* Grepr call Grepr( '<args>' )
"}}}

" sidemenu {{{
" nnoremap <leader>k :Vexplore<cr>
" let g:netrw_winsize = 25 "window width
" let g:netrw_altv=1 "open vertical splits on the right
" let g:netrw_liststyle=3
" let g:netrw_winsize = 0

nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"}}}

"spelling {{{
fun! FixLastSpellingError()
    normal! mm[s1z=`m
endfun
nnoremap <leader>fs :call FixLastSpellingError()<cr>
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
autocmd filetype rst,txt,markdown set spell spelllang=en_us
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

"undo {{{
set undofile "enable undoing
set undodir=~/.vim/undo/
set undolevels=100
set undoreload=100
"}}}

" backup options {{{
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

map <Leader>id :IndentGuidesToggle<cr>
autocmd filetype html,tpl :IndentGuidesEnable
"}}}

" ctrlsf {{{
" let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ackprg='rg'
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_default_view_mode = 'compact'

"find word under cursor
noremap <leader>fw :CtrlSF <C-r><C-w>
fun! FindIt(str)
    :AsyncRun ':CtrlSF "'.a:str.'"<cr>'
    return a:str;
endfun

nnoremap <leader>fi :CtrlSF

function! FindStringWiki()
    let curline = getline('.')
    call inputsave()
    let name = input('Find on wiki: ')
    call inputrestore()
    execute ":CtrlSF ".name." ".$WIKI_PATH
endfunction
"}}}

" fold {{{
"enter fold giving a list of options on conflicts
nnoremap <C-]> g<C-]>
let g:markdown_folding = 1

fun FoldFiletypeSpecific()

    set foldmarker={{{,}}}
    set foldcolumn=2
    set foldmethod=marker
    set foldenable
    set foldlevel=1
    set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo


    let MIN_LINES_TO_FOLD = 80
    if (line('$') < MIN_LINES_TO_FOLD)
        setlocal foldenable!
        return
    endif

    let indent_filetypes=['php','python','scala','swift']
    for s in  indent_filetypes
        if (&filetype == s)
            setlocal foldmethod=indent
            return
        endif
    endfor

    if (&filetype == "markdown")
      setlocal foldmethod=expr
        return
    endif

    if (&filetype == "vim")
        setlocal foldlevel=0
        return
    endif
endfunc
autocmd! BufReadPost * call FoldFiletypeSpecific()

"disable indent fold for files with less than 60 lines

fun! FoldSomething(str)
    let comment=split(&commentstring, '%s')
    if len(l:comment)==1
        call add(comment, l:comment[0])
    endif
    return l:comment[0]." {{{\n".a:str."\n".l:comment[1]."}}}"
endfun

call toop#mapFunction('FoldSomething', '<leader>fo')
"}}}

"eval {{{
fun! Eval(str)
    :VimuxRunCommand(a:str."\n")
endfunc
call toop#mapFunction('Eval', '<leader>ev')

nmap <Leader>els :VimuxRunCommand("\n")<CR>
nmap <Leader>el :VimuxRunLastCommand<CR>

fun! Subs(str)
    let my_filetype = &filetype
    let out = ChompedSystemCall('subs -p '.my_filetype, a:str."\n")
    return out
endfunc
call toop#mapFunction('Subs', '<leader>o')
"}}}

" journal, diary {{{
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
nnoremap <Leader>to :Tomorrow<cr>
command! -nargs=* Monday call Diary( 'monday' )
nnoremap <Leader>mon :Monday<cr>
command! -nargs=* Yesterday call Diary( 'yesterday' )
nnoremap <Leader>yes :Yesterday<cr>
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

fun! GetCurrentLineContent()
    return getline('.')
endfunc

fun! GetLinkUri(str)
    let result = system('sed "s/.*\[.*\](\(.*\)).*/\1/"', a:str)
    let @c = result
    return @c
endfunc

fun! OpenFileForMarkdown()
    let line = GetCurrentLineContent()
    if line =~ 'http'
         let url = GetLinkUri(line)
         :call OpenUrl(url)
         return
    elseif line =~ '\[.*\]\(.*\)'
        let url = GetLinkUri(line)
        let path = expand('%:p:h')
        execute 'edit ' . path . '/' . url . '.md'
    endif
endfun
autocmd FileType markdown nnoremap <buffer> <CR> :call OpenFileForMarkdown()<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

fun! OpenUrl(url)
    silent execute '! open "' . a:url . '" 1>/dev/null  &'
endfunc
nnoremap gx :call OpenUrl()<cr>

fun! GrepWiki( rg )
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

" relative to current file {{{

command! -nargs=* ForceSave call SaveForcing()
command! -nargs=* SaveForce call SaveForcing()
command! -nargs=* RemoveFile call RemoveFile()
"open directory
command! -nargs=* OpenDirectory :!open %:p:h &<cr>

noremap <silent> <leader>rmrf :RemoveFile<cr>
nmap <leader>od :VimuxRunCommand("cd ".expand('%:p:h'))<cr>
nmap <leader>ls :VimuxRunCommand("cd ".expand('%:p:h'))<cr>
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
map <Leader>rn :call RenameFile()<cr>
map <Leader>cp :call CopyFile()<cr>
map <leader>ee :edit!<cr>
map <leader>ck :!git checkout %<cr>
"insert filname in insert mode
inoremap <C-f> <C-R>=expand("%:t:r")<CR>


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

fun! SaveForcing()
    execute "w !sudo tee > /dev/null %"
endfunc
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
    let old_name = expand('%:t')
    let old_dir = expand('%:p:h')

    setlocal splitbelow
    execute "split" $HOME."/tmp/vimcommands"
    res -15

    let out = 'cd '.old_dir.' ; mv '.old_name.' '.old_name
    call append(0, split(out, '\v\n'))
    normal! gg$
    :set syntax=sh
    nnoremap <buffer> <CR> :call RunLine()<cr>
endfunc

fun! CopyFile()
    let old_name = expand('%:t')
    let old_dir = expand('%:p:h')

    setlocal splitbelow
    execute "split" $HOME."/tmp/vimcommands"
    res -15

    let out = 'cd '.old_dir.' ; cp '.old_name.' '.old_name
    call append(0, split(out, '\v\n'))
    normal! gg$
    :set syntax=sh
    nnoremap <buffer> <CR> :call RunLine()<cr>
endfunc

fun! RunLine()
    :echom "gandalf"
    let line = GetCurrentLineContent()
    :VimuxCloseRunner
    :VimuxRunCommand(line."\n")
    :q
endfun

"}}}

"git {{{
fun! GitLog()
    let path = expand('%:p')
    let cmd='export REALP=$(realpath '.path.') ; cd $(dirname $REALP) ; git log -p --follow $(realpath $REALP)'
    :execute 'vnew | 0read ! '.cmd
    :set syntax=git
    :normal gg
endfunc
nmap <leader>gk :call GitLog()<cr>
nmap <leader>gl :call GitLog()<cr>

fun! GitDiff()
    let path = expand('%:p')
    let cmd='export REALP=$(realpath '.path.') ; cd $(dirname $REALP) ; git diff $(realpath $REALP)'
    :execute 'vnew | 0read ! '.cmd
    :set syntax=git
    :normal gg
endfunc
nmap <leader>gdf :call GitDiff()<cr>

map <leader>gck :!git checkout %<cr>

map <leader>gckp :!git checkout HEAD~1 %<cr>
command! -nargs=* Blame :Gblame<cr>
map <leader>gb :Gblame<cr>

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
"}}}

" gvim {{{
" nnoremap <leader>gv  :! gvim %:p<cr>
" set guioptions+=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar
" if has('gui_running')
"   set guifont=DejaVu\ Sans\ Mono\ Book\ 13
" endif
"}}}

"writer mode {{{
let writer_mode=$WRITER_MODE
fun! WritingMode()
    :Goyo
endfun
command! -nargs=* WritingMode call WritingMode()
map <Leader>wm :call WritingMode()<cr>
"}}}

" {{{ search
set hlsearch " match while typing the search
set incsearch "show the next match while entering a search
set ignorecase "the case of normal letters is ignored
set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters

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

"}}}

" simple filetype configs {{{
au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar set filetype=zip
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd filetype crontab setlocal nobackup nowritebackup
"}}}

"fzf {{{
let g:fzf_buffers_jump = 1
map <c-p> :FZF<cr>
nnoremap <silent> <c-a> :call fzf#run(fzf#wrap({
\    'source': 'find .'
\ }))<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>bl :call fzf#run(fzf#wrap({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ }))<CR>


" MRU {{{
nnoremap <leader>mru :Mru<cr>
"}}}

let g:fzf_buffers_jump = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"}}}

" repl, eval, tmux integration {{{
let g:VimuxHeight = "20"
fun! TmuxContent()
    let idx = g:VimuxRunnerIndex
    let out = system('tmux capture-pane -J -p -t '.idx.' > /tmp/tmux')
    :vsplit /tmp/tmux
endfunc
nnoremap <leader>ec :call TmuxContent()<cr>
nnoremap <leader>eh :call TmuxContent()<cr>

let g:repls = {
\   'ruby': 'irb',
\   'python': 'python',
\   'haskell': 'ghc',
\   'php': 'boris',
\   'scala': 'sbt',
\   'default': 'irb',
\}

fun! RunRepl()
    if (has_key(g:repls, &filetype))
      let cmd = get(g:repls, &filetype)
      :VimuxRunCommand(cmd."\n")
      return
    endif

    let cmd = get(g:repls, 'default')
    :VimuxRunCommand(cmd."\n")
endfunc
nmap <leader>rr  :call RunRepl()<cr>

"}}}

" debug {{{
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

let g:vdebug_options = {
\       'path_maps': {
\               '/var/www/getyourguide.com/current': '/home/jean/projects/fishfarm',
\    }
\}

fun! ShowStringOnNewWindow(content)
    split _output_
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(a:content, '\v\n'))
endfun

fun! NotifySend(content)
    :Asyncrun notify-send '".a:content."'"
endfun
"}}}

"tags {{{
set tags=./tags
let g:gutentags_ctags_extra_args=["--fields=+aimlS"]
let g:gutentags_ctags_executable="myctags"
" autocmd filetype php let g:gutentags_ctags_executable="phpctags"
" let g:gutentags_exclude = ['*.css', '*.html', '*.js']
" let g:gutentags_cache_dir = '~/.vim/gutentags'
"}}}

" run tests {{{
noremap <silent> <leader>tn :TestNearest<CR> " t Ctrl+n
noremap <silent> <leader>tf :TestFile<CR>    " t Ctrl+f
noremap <silent> <leader>ts :TestSuite<CR>   " t Ctrl+s
noremap <silent> <leader>tl :TestLast<CR>    " t Ctrl+l
noremap <silent> <leader>tg :TestVisit<CR>   " t Ctrl+g
let test#strategy = "vimux"
"}}}

"docummentation search {{{
fun! Documentation(str)
    if (&filetype == 'scala')
        let url = 'https://www.scala-lang.org/api/current/?search='.a:str
        let out = system("open '" . url . "' ")

        let url = 'https://www.google.com/search?&q=spark+scala+'.a:str
        let out = system("open '" . url . "' ")

        return
    endif

    if (&filetype == 'php')
        let url = 'http://php.net/search.php?q='.a:str
        let out = system("open '" . url . "' ")
        return
    endif


    if (&filetype == 'swift')
        let url = 'https://developer.apple.com/search/?q='.a:str
        let out = system("open '" . url . "' ")
        return
    endif

    if (&filetype == 'vim')
        execute ":help ".a:str
        return
    endif


    execute ":DevDocsAll ".a:str
endfunc

call toop#mapFunction('Documentation', '<leader>doc')
call toop#mapFunction('Documentation', '<leader>dc')
nmap <leader>dw  "zyiw:exe "call Documentation('".@z."')"<cr>
"}}}

" windows management {{{
nmap <leader>vn :vnew<cr>
nnoremap <leader>on :only<cr>
set splitright "split new windows to the right
let g:resize_count = 19
let g:vim_resize_disable_auto_mappings = 1
nnoremap <leader>H :CmdResizeLeft<cr>
nnoremap <leader>L :CmdResizeRight<cr>
nnoremap <leader>K :CmdResizeUp<cr>
nnoremap <leader>J :CmdResizeDown<cr>
nnoremap <leader>= <C-w>=

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
"}}}

" macros {{{
fun! RepeatAndNext()
    let @q ="n."
    normal! @q
endfun
nnoremap <leader>. :call RepeatAndNext()<cr>
"}}}

" language specific {{{
" markdown {{{
let g:vim_markdown_no_extensions_in_markdown = 1
autocmd Filetype markdown call MarkdownDefaultConfigs()

fun! MarkdownDefaultConfigs()
    " set tw=80 "80 columns are more than enough
    set spell spelllang=en_us
    nnoremap <leader>h1 :call UnderlineHeading(1)<cr>
    nnoremap <leader>h2 :call UnderlineHeading(2)<cr>
    nnoremap <leader>h3 :call UnderlineHeading(3)<cr>
    nnoremap <leader>h4 :call UnderlineHeading(4)<cr>
    nnoremap <leader>h5 :call UnderlineHeading(5)<cr>
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

"}}}

"PHP {{{
call toop#mapShell('json_encode_from_php', '<leader>pj')
call toop#mapShell('json-to-php', '<leader>jp')
"}}}

" {{{ C lang
fun! CFiletypeConfigs()
    "compile through gcc when there's no makefile
    if !filereadable(expand("%:p:h")."/Makefile")
        setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
    endif
endfun
autocmd filetype c call CFiletypeConfigs()
"}}}

" elm {{{
let g:elm_format_autosave = 0
let g:elm_make_show_warnings = 0
let g:elm_detailed_complete = 0
"}}}
"}}}

"custom text objects{{{

call textobj#user#plugin('function', {
\   'code': {
\     'select-a-function': 'AFunction',
\     'select-a': 'af',
\     'select-i-function': 'IFunction',
\     'select-i': 'if',
\   },
\ })


let g:functionKeywordByFiletype = {
\   "swift": "func",
\   "c": "function",
\   "vim": "fun",
\   "php": "function",
\   "rust": "fn",
\   "go": "func",
\   "fallback": "fun",
\}

fun! GetFiletypeFuncKeyword()
    if (has_key(g:functionKeywordByFiletype, &filetype))
        return get(g:functionKeywordByFiletype, &filetype)
    endif
    return get(g:functionKeywordByFiletype, 'fallback')
endfun

fun! AFunction()
    let funcKeyword = GetFiletypeFuncKeyword()
    execute "?".funcKeyword
    normal! 0w
    let head_pos = getpos('.')
    call SearchLineOrDocument("{")
    normal! %
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

fun! IFunction()
    let backup_pos = getpos(".")

    let funcKeyword = GetFiletypeFuncKeyword()
    execute "?".funcKeyword

    call SearchLineOrDocument("{")
    let tmp_head = getpos('.')
    normal! %
    let tmp_tail = getpos('.')
    call setpos('.', tmp_head)
    normal! w
    let head_pos = getpos('.')
    call setpos('.', tmp_tail)
    normal! b
    let tail_pos = getpos('.')

    return ['v', head_pos, tail_pos]
endfun


call textobj#user#plugin('fold', {
\   'code': {
\     'pattern': ['{{{', '}}}'],
\     'select-a': 'aF',
\     'select-i': 'iF',
\   },
\ })

call textobj#user#plugin('star', {
\   'code': {
\     'select-a-function': 'CurrentStarBlock',
\     'select-a': 'a*',
\     'select-i-function': 'CurrentStarBlock',
\     'select-i': 'i*',
\   },
\ })


fun! CurrentStarBlock()
    let backup_pos = getpos(".")
    normal! F*
    if (getpos(".") == backup_pos)
        ?\*
    endif
    let head_pos = getpos('.')
    call setpos('.', backup_pos)
    call SearchLineOrDocument("*")
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun


fun! SearchLineOrDocument(char)
    let backup_pos = getpos(".")
    execute "normal! f".a:char
    if (getpos(".") == backup_pos)
        execute "/".a:char
    endif
endfunc

call textobj#user#plugin('strike', {
\   'code': {
\     'select-a-function': 'CurrentStrikeBlock',
\     'select-a': 'a-',
\     'select-i-function': 'CurrentStrikeBlock',
\     'select-i': 'i-',
\   },
\ })


fun! CurrentStrikeBlock()
    let backup_pos = getpos(".")
    ?---
    let head_pos = getpos('.')
    call setpos('.', backup_pos)
    /---
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

call textobj#user#plugin('markdownsection', {
\   'code': {
\     'select-a-function': 'CurrentMarkdownBlock',
\     'select-a': 'a#',
\     'select-i-function': 'CurrentMarkdownBlock',
\     'select-i': 'i#',
\   },
\ })

fun! CurrentMarkdownBlock()
    :?#
    let head_pos = getpos('.')
    normal! 0j


    "if there's any block below go to it otherwise go to the end of the file
    if search("#", "ncWz") > 0
        :/#
        normal! k
    else
        normal! G
    endif

    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfun

" line object {{{
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

"}}}

"between bars / {{{
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

"}}}

"between pipes {{{
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

"}}}
"}}}

" toop -  custom text actions {{{
"to single quote
call toop#mapShell("tr '\"' \"'\"", '<leader>tsq')
call toop#mapShell('md5sum | cut -d " " -f1 ', '<leader>md5')
call toop#mapShell('mycopy', '<leader>mc')
call toop#mapShell('run_function trim ', '<leader>tr')
call toop#mapShell('url-decode ', '<leader>d')
call toop#mapShell('run_function toCamelCase', '<leader>tcc')
call toop#mapShell('run_function toSnakeCase', '<leader>tcs')
call toop#mapShell('jq .', '<leader>jq')
call toop#mapShell('jq .', '<leader>jb')
call toop#mapShell('url-to-json', '<leader>ju')
call toop#mapShell('run_function alnum ', '<leader>a')
"unescape
call toop#mapShell('sed "s/\\\//g" ', '<leader>u')
call toop#mapShell('run_function sql_format', '<leader>sb')
call toop#mapShell('run_function xml_beautifier', '<leader>x')
call toop#mapShell('run_function xml_beautifier', '<leader>xb')
call toop#mapShell('base64', '<leader>e64')
call toop#mapShell('base64 --decode ', '<leader>d64')


"translate
call toop#mapShell('translate.sh en pt', 'tep')
call toop#mapShell('translate.sh pt en', 'tpe')
call toop#mapShell('translate.sh pt de', 'tpd')
call toop#mapShell('translate.sh en de', 'ted')
call toop#mapShell('translate.sh de en', 'tde')
call toop#mapShell('translate.sh de en', 'tge')
call toop#mapShell('translate.sh de pt', 'tdp')
call toop#mapShell('translate.sh en fr', 'tef')
call toop#mapShell('translate.sh en la', 'tel')
call toop#mapShell('translate.sh la en', 'tle')
call toop#mapShell('translate.sh de en', '<leader>ge')
"translate English to German
call toop#mapShell('translate.sh en de', '<leader>eg')

call toop#mapShell('tr " " "\n"', '<leader>sn')
"make numbered list
call toop#mapShell("runFunction makeNumberedList", '<leader>nl')
"make list
call toop#mapShell("awk '// { print \"- \"$0 }'", '<leader>ml')
call toop#mapShell('graph-easy', '<leader>mg')
call toop#mapShell('runFunction yml2json', '<leader>yj')
call toop#mapShell('runFunction toggleQuote', '<leader>tq')

"strike through
call toop#mapAround('~~', '~~', '<leader>st')
"math block
call toop#mapAround('$', '$', '<leader>mb')
call toop#mapAround('`', '`', "<leader>`")
call toop#mapAround("'", "'", "<leader>'")
call toop#mapAround("'", "'", "<leader>qs")
call toop#mapAround('"', '"', '<leader>qd')
call toop#mapAround('"', '"', '<leader>"')
call toop#mapAround('*', '*', '<leader>*')
call toop#mapAround('(', ')', '<leader>(')
call toop#mapAround('[', ']', '<leader>[')
call toop#mapAround('{', '}', '<leader>{')
call toop#mapAround('$', '$', '<leader>$')
call toop#mapAround('<', '>', '<leader><')
"markdown italic
call toop#mapAround('*', '*', '<leader>it')
"markdown bold
call toop#mapAround('**', '**', '<leader>bo')
call toop#mapAround("***\n", '***', '<leader>hl')
call toop#mapAround("```sh\n", "\n```", '<leader>c')
call toop#mapAround("\n---\n", "\n---\n", '<leader>-')
nnoremap <leader>- i---<esc>

fun! GoogleIt(str)
    execute 'AsyncRun run_function googleIt "'.a:str.'"'
endfunc
call toop#mapFunction('GoogleIt', '<leader>gi')
function! Duplicate(string)
    return a:string.a:string
endfun
call toop#mapFunction('Duplicate', "<leader>2x")

fun! FoldSomething(str)
    let comment=split(&commentstring, '%s')
    if len(l:comment) == 1
        call add(comment, l:comment[0])
    endif
    return l:comment[0]." {{{\n".a:str."\n".l:comment[1]."}}}"
endfun

call toop#mapFunction('FoldSomething', ',fo')

fun! OnlyTextSelection(str)
    normal! ggVGx
    set noreadonly
    call append(0, split(Chomp(a:str), '\v\n'))
endfun
call toop#mapFunction('OnlyTextSelection', '<leader>ts')

function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfun

function! ChompedSystemCall( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfun


"render a html chunk on the browser
fun! BCat(str)
    :'<,'>AsyncRun browser-cat
endfunc
call toop#mapFunction('BCat', '<leader>bc')
call toop#mapFunction('FindIt', '<leader>fit')


fun! FindLocal(str)
    let path = expand('%:p:h')
    exec ':CtrlSF "'.a:str.'"  "'.path.'" <cr>'
    return a:str
endfun
call toop#mapFunction('FindLocal', '<leader>fl')
"}}}

"cursor{{{
"save the previous cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

set cursorline
set cursorcolumn

fun! CursorToggle()
    set cursorline!
    set cursorcolumn!
endfun
command! -nargs=* CursorToggle call CursorToggle()
nnoremap <leader>ct  :call CursorToggle()<cr>
"}}}

"performance {{{
set ttyfast "Improves smoothness of redrawing when there are multiple windows
" autocmd BufEnter * :syn sync maxlines=500
set lazyredraw "don't redraw screend when running macros
" if the 256 is a command things will break
" so I'll disable this thing for now
" syntax sync minlines=256
"increase redraw time, useful for big files
set redrawtime=10000
syntax sync fromstart


"disables syntax for files going over a certain size
" autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" set nocursorline "highlighting of the current line is a big deal for vim, probably the most important setting
" set synmaxcol=128
"}}}

"theme, colors, highlights {{{
"the later syntax is applied the better
"since something might override it
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
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:solarized_termtrans = 1

set background=dark
if $VIM_THEME == "light"
    set background=light
endif

colorscheme solarized
let g:solarized_bold=1
set t_Co=256
" color 0 is the dark background and 15 is the light one hi StatusLine ctermfg=12 ctermbg=0 cterm=NONE

"reapplies the sytanx when it's broken
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
"}}}

nnoremap <leader>lc :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <leader>dco :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>def :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>rnc :call LanguageClient#textDocument_rename()<CR>


