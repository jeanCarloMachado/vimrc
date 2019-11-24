" Welcome to my vim
"
" ## Conventions
" Comments about code should go above the code now below
" Every non obvious change should be commited. I really forget after a while
"
" Userspace dependencies
" - par
" - rg
" - ctags https://github.com/universal-ctags/ctags
" - yaourt -S python-proselint write-good flake8
" Changelog
"
"
" - Tue 21 May 2019 09:28:46 AM CEST - drop gist support because they are dangerous security-wise
" let g:theme = 'light'
let g:theme = 'dark'
" plugins load {{{
set nocompatible
filetype on
filetype plugin on "loading the plugin files for specific file types
call plug#begin()
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'altercation/vim-colors-solarized'
"inline errors, linting
Plug 'w0rp/ale', {'commit': 'b1230873b6c2044864b3ea2302b8521670fa4137'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-user' "enable the creation of custom text objects
"same indentation text object
Plug 'michaeljsmith/vim-indent-object'
"grep like sublime one
Plug 'dyng/ctrlsf.vim'
"quoting/parenthesizing
Plug 'tpope/vim-surround'
"shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter', {'commit': 'c75c83df531881008f8cf903eab7cd68bc19ff7a'}
Plug 'tpope/vim-commentary'
" this plugin is slow when the project is too big
"most recently used files list
Plug 'git@github.com:skywind3000/asyncrun.vim.git'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'wakatime/vim-wakatime'
Plug 'benmills/vimux'
" removed because i do not use it enough
" Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
"autocomplete pairs chars
Plug 'raimondi/delimitmate'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" removed because I do no use it enough
Plug 'Xuyuanp/nerdtree-git-plugin'
"useful to get the recent opened files
Plug 'mhinz/vim-startify'
" removed because sometimes I do not want to go to the root
" Plug 'airblade/vim-rooter'
" Plug 'vim-syntastic/syntastic', { 'for': ['swift'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-abolish'
" removed because i do not use it enough
"git commit browser in vim
" Plug 'junegunn/gv.vim'
Plug 'tpope/vim-repeat'
Plug 'RRethy/vim-illuminate'
"add highlights to misused spaces
Plug 'ntpeters/vim-better-whitespace'
" Plug 'blueyed/vim-diminactive'
" Plug 'nathanaelkane/vim-indent-guides', { 'for': ['html', 'vue', 'yaml', 'yml', 'tpl'] }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
" autocompletion {{{
"ncm2 is better than  deoplete :)
if ! has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

    Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

"enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" Important: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'wellle/tmux-complete.vim'
Plug 'pandysong/ghost-text.vim'
"}}}
"get beautiful icons for nerdtree
Plug 'ryanoasis/vim-devicons'
" snippets {{{
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
"}}}
"make the yanked region appartent
"replaces the yanked text with a text object gr{textobject} to paste  and can
"be repeatable!
"exchange text objects super useful!
" cx {textobject}  move to a new place, cx{textobject} will swap them
" text object stuff {{{
Plug 'jeanCarloMachado/vim-toop'
" swap text objects from location
Plug 'tommcdo/vim-exchange'
Plug 'bps/vim-textobj-python'
Plug 'wellle/targets.vim'


" programming languages {{{
" Plug 'lervag/vimtex', { 'for': ['latex'] }
"
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'chrisbra/csv.vim', { 'for': ['csv'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins', 'for': ['scala'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': ['php'] }
"removed vdebug because of my reliance on python debugger and phpstorm
" Plug 'vim-vdebug/vdebug', {'for': ['php'] }
"filetype only * (for swift)
" Plug 'keith/swift.vim', {'for': ['swift']}
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
"hides links paths, and other small niceties
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" Mon 16 Sep 2019 06:01:40 PM CEST
" disabled because I do not like the colorscheme and it is a bit confusing
" Plug 'bagrat/vim-buffet'
"}}}

" ==== discarded plugins and why ====
" Plug 'vim-scripts/argtextobj.vim'
" visualizing marks - not essential, better to have a high performant vim
" Plug 'kshenoy/vim-signature'
" better tags management -  I do not use tags anymore, rely on language server instead
" Thu 12 Sep 2019 10:31:46 AM CEST re-enabled that because is necessary for
" fishfarm sometimes
Plug 'ludovicchabant/vim-gutentags'
""seeing git log and git diff - I kind of prefer to handle git stuff in the shell
"Plug 'tpope/vim-fugitive'
"marks search matching parts while typing - not really important
" Plug 'markonm/traces.vim'
"}}}

Plug 'sheerun/vim-polyglot'
call plug#end()
"}}}

" {{{ generic
set wildignore+=*\\dist\\**
let mapleader = "\<space>"

"Tue 19 Nov 2019 12:06:15 PM CET disable mosue due to it fucking up my clipboard selection
" set mouse=a "enable mouse on normal,visual,inter,command-line modes
set backspace=indent,eol,start "make the backspace work like in most other programs
" set cot+=menuone "Use the popup menu also when there is only one match
set number "show numbers
set hidden "hides buffers instead of closing them, don't give warnings on unsaved things
set shell=$SHELL
set encoding=UTF-8
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
set clipboard=unnamed " copy to the system clipboard
set clipboard+=unnamedplus
" if has("clipboard")
"     set clipboard=unnamed " copy to the system clipboard
"     if has("unnamedplus") " X11 support
"         set clipboard+=unnamedplus
"     endif
" endif
runtime macros/matchit.vim "Enable extended % matching
"}}}

"Generic mappings{{{
"Allow using the repeat operator with a visual selection
vnoremap . :normal .<CR>
nnoremap + ddp
nnoremap _ dd2kp
nnoremap <Leader>le :noh<cr>
"returns the current date
nnoremap <Leader>dt :r ! date<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap cwi ciw
" map <leader>i mmgg=G`m
map <leader>x :w<','> !bash<cr>
map <leader>me :!chmod +x %<cr>
nnoremap <leader>nt :tabnew<cr>
"open directory
nmap <leader>sh :!cd %:h && zsh <cr>
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <silent> <leader>ve :e $MY_VIMRC<cr>:lcd %:h<cr>

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

" nnoremap <leader>cr :ProjectRootCD<cr>
" nnoremap <leader>pr :ProjectRootCD<cr>
" fun! ProjectRootCd( arg )
"     root = call FindRootDirectory()
"     cd root
" endfun
" command! -nargs=* ProjectRootCd call ProjectRootCd( '<args>' )

"}}}

"linting, fixing - ale config {{{
nnoremap <leader>fmt :ALEFix<cr>
let g:ale_set_highlights = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_writegood_options = ' --so --illusion --adverb --tooWordy --cliches'
" let g:ale_sign_warning = '⚠'
" let g:ale_sign_error = '✖'
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_fix_on_save = 0

"change ruleset for fishfamr
" autocmd BufRead,BufNewFile */fishfarm/* let g:ale_php_phpcs_standard = "/home/jean/projects/activity-classifier/ruleset.xml"

" let g:ale_php_cs_fixer_options = " --config /home/jean/projects/personalscripts/fishfarmstyle.php "
let g:ale_php_cs_fixer_executable = '/home/jean/Dropbox/projects/dotfiles/scripts/php-cs-fixer-fishfarm.sh'

let g:ale_linters = {
\   'python': ['mypy', 'flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'sh': ['shell', 'shellcheck'],
\   'markdown': ['write-good', 'proselint'],
\   'scala': ['fsc', 'scalac'],
\   'swift': ['swiftlint'],
\   'php': ['php', 'phpcs'],
\   'elm': ['elm-fomart', 'elm-make']
\}

" the python fixer that sets the correct indentation for files is  yapf
" and we have a copy of it in personal scripts: /home/jean/Dropbox/projects/dotfiles/scripts/yapf
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'yapf'],
\   'php': ['php_cs_fixer'],
\   'scala': ['scalafmt'],
\   'swift': ['swiftformat'],
\   'elm': ['elm-format']
\}

"}}}

" autocomplete {{{
let g:ale_completion_enabled = 1
" set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
"}}}

" concealing {{{
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
"
fun! ToggleLeftMenu( arg )
    " let rootDir = FindRootDirectory()
    execute ":NERDTreeToggle "
endfun
command! -nargs=* ToggleLeftMenu call ToggleLeftMenu( '<args>' )

nnoremap <leader>k :ToggleLeftMenu<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
"}}}

"spelling {{{
fun! FixLastSpellingError()
    normal! mm[s1z=`m
endfun
nnoremap <leader>fs :call FixLastSpellingError()<cr>
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
autocmd filetype rst,txt,markdown set spelllang=en,de_de,pt_br
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
map <Leader>prod :call OpenQuickly('productivity')<cr>
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
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
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


    let MIN_LINES_TO_FOLD = 45
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
        setlocal foldlevel=0
        return
    endif

    if (&filetype == "vim")
        setlocal foldlevel=0
        return
    endif
endfunc
autocmd! BufReadPost * call FoldFiletypeSpecific()
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
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
" send the content to a tmux pane, running whatever,
" bash, python, etc
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
    call WritingMode()
endfunc

command! -nargs=* Today call Diary( 'today' )
command! -nargs=* Someday call Diary( 'someday' )
command! -nargs=* Diary call Diary( '<args>' )
command! -nargs=* Diary call Diary( '<args>' )
nnoremap <Leader>now :Today<cr>
nnoremap <Leader>n :Today<cr>
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
    silent execute "! open '" . a:url . "' 1>/dev/null  &"
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
"
autocmd BufNewFile *[^Test].php 0r $TEMPLATES_DIR/php.php
autocmd BufNewFile *[^test]_.*.py 0r $TEMPLATES_DIR/py.py
autocmd BufNewFile *.py 0r $TEMPLATES_DIR/test.py
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
autocmd BufNewFile */composer.json 0r $TEMPLATES_DIR/composer.json
autocmd BufNewFile */phpunit.xml 0r $TEMPLATES_DIR/phpunit.xml
autocmd BufNewFile */*Test.php 0r $TEMPLATES_DIR/phpTest.php
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
map <Leader>mv :call MoveFile()<cr>
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

fun! MoveFile()
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
au BufRead,BufNewFile *.vue set syntax=javascript
autocmd BufNewFile,BufRead *.es6,*.ts set filetype=javascript
autocmd BufNewFile,BufRead *.thrift set syntax=c
autocmd filetype crontab setlocal nobackup nowritebackup

" autocmd filetype php let g:ale_fix_on_save = 0
"}}}

"fzf {{{
let g:fzf_buffers_jump = 1
" map <c-p> :FZF<cr>
nnoremap <silent> <c-p> :call fzf#run(fzf#wrap({
\    'source': 'find .'
\ }))<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>bl :call fzf#run(fzf#wrap({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bopen'),
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

" repl, eval, tmux integration {{{;
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

fun! Repl()
    if (has_key(g:repls, &filetype))
      let cmd = get(g:repls, &filetype)
      :VimuxRunCommand(cmd."\n")
      return
    endif

    let cmd = get(g:repls, 'default')
    :VimuxRunCommand(cmd."\n")
endfunc
nmap <leader>rr  :call Repl()<cr>

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
let g:gutentags_ctags_exclude_wildignore=0
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


""" tried already to to pdf of buffer but is very hard to do so. I do not
""" is useful to expend extra time on this shit
fun! PDFFile(str)
    let path = expand('%:p')
    execute 'AsyncRun run_function pdfFromFile "'.path.'"'
endfun
command! -nargs=* PDFFile call PDFFile( '<args>' )
nnoremap <Leader>pdf :PDFFile<cr>



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
fun! ElmConfigs()
    let g:elm_format_autosave = 0
    let g:elm_make_show_warnings = 0
    let g:elm_detailed_complete = 0
endfun
autocmd filetype elm call ElmConfigs()
"}}}
"}}}

"custom text objects{{{


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

" call textobj#user#plugin('function', {
" \   'code': {
" \     'select-a-function': 'AFunction',
" \     'select-a': 'af',
" \     'select-i-function': 'IFunction',
" \     'select-i': 'if',
" \   },
" \ })


" fun! AFunction()
"     let funcKeyword = GetFiletypeFuncKeyword()
"     execute "?".funcKeyword
"     normal! 0w
"     let head_pos = getpos('.')
"     call SearchLineOrDocument("{")
"     normal! %
"     let tail_pos = getpos('.')
"     return ['v', head_pos, tail_pos]
" endfun

" fun! IFunction()
"     let backup_pos = getpos(".")

"     let funcKeyword = GetFiletypeFuncKeyword()
"     execute "?".funcKeyword

"     call SearchLineOrDocument("{")
"     let tmp_head = getpos('.')
"     normal! %
"     let tmp_tail = getpos('.')
"     call setpos('.', tmp_head)
"     normal! w
"     let head_pos = getpos('.')
"     call setpos('.', tmp_tail)
"     normal! b
"     let tail_pos = getpos('.')

"     return ['v', head_pos, tail_pos]
" endfun


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
call toop#mapShell('python3 -c "import sys,urllib.parse;print(urllib.parse.quote(sys.stdin.read().strip()))"', '<leader>ue')
call toop#mapShell('python3 -c "import sys,urllib.parse;print(urllib.parse.unquote(sys.stdin.read().strip()))"', '<leader>ud')


" interpret function serves to evaluate simple expressions inline in pure
" python, is sort of eval but sends the stdout back in the page
" good for using vim sort as a notebook where you keep your equations
" close to the text your are using to explain
"
call toop#mapShell('RESULT_PREFIX="#" run_function printInputAndOutput interpret', '<leader>ii')
"align columns
"make tables beautiful
call toop#mapShell('tablign', '<leader>ta')
"translate

call toop#mapShell('VOICE=1 translate.sh en de', '<leader>vo')
" for voice memorization
call toop#mapShell('run_function printInputAndOutput bash -c "audioMemorizationGeneration.sh 1>/dev/null"', '<leader>vm')

call toop#mapShell('runFunction translateDuplicating de en', '<leader>ge')
call toop#mapShell('runFunction translateDuplicating en de', '<leader>eg')

call toop#mapShell('runFunction translateDuplicating en pt', '<leader>tep')
call toop#mapShell('runFunction translateDuplicating pt en', '<leader>tpe')
call toop#mapShell('runFunction translateDuplicating pt de', '<leader>tpd')
call toop#mapShell('runFunction translateDuplicating en de', '<leader>ted')
call toop#mapShell('runFunction translateDuplicating en fr', '<leader>tef')
call toop#mapShell('runFunction translateDuplicating en la', '<leader>tel')
call toop#mapShell('runFunction translateDuplicating la en', '<leader>tle')

call toop#mapShell('translate.sh de en', '<leader>sge')
call toop#mapShell('translate.sh en de', '<leader>seg')
call toop#mapShell('translate.sh en pt', '<leader>sep')
call toop#mapShell('translate.sh pt en', '<leader>spe')
call toop#mapShell('translate.sh pt de', '<leader>spd')
call toop#mapShell('translate.sh en de', '<leader>sed')
call toop#mapShell('translate.sh de en', '<leader>sde')
call toop#mapShell('translate.sh de pt', '<leader>sdp')
call toop#mapShell('translate.sh en fr', '<leader>sef')
call toop#mapShell('translate.sh en la', '<leader>sel')
call toop#mapShell('translate.sh la en', '<leader>sle')

call toop#mapShell('tr " " "\n"', '<leader>sn')
"make numbered list
call toop#mapShell("runFunction makeNumberedList", '<leader>nl')
"make list
call toop#mapShell("awk '// { print \"- \"$0 }'", '<leader>ml')
call toop#mapShell('runFunction graphEasyDuplicating', '<leader>mg')
call toop#mapShell('runFunction graphEasyImage', '<leader>mi')
call toop#mapShell('runFunction yml2json', '<leader>yj')
call toop#mapShell('runFunction toggleQuote', '<leader>tq')
call toop#mapShell('runFunction addMemrize', '<leader>am')
call toop#mapShell('runFunction addTrelloCard', '<leader>ct')

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
call toop#mapAround("```\n", "\n```", '<leader>cb')
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

fun! CursorVerticalToggle()
    set cursorcolumn!
endfun
command! -nargs=* CursorVerticalToggle call CursorVerticalToggle()
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




let g:solarized_termcolors= 16
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let  g:solarized_visibility= "high"
set t_Co=256

"base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
"base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
"base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
"base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
"base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
"base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
"base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
"base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
"yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
"orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
"red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
"magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
"violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
"blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
"cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
"green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60


colorscheme solarized

"reapplies the sytanx when it's broken
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
"}}}


"VERY useful skill
let g:LanguageClient_serverCommands = {
			\'python' : ['pyls', '-v', '--log-file', '/tmp/pyls'],
            \'php' : ['restartWhenFails', 'php', '/home/jean/.composer/vendor/bin/php-language-server.php', '--memory-limit=2G']
			\ }
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_autoStop = 1
" let g:LanguageClient_trace = 1

"see all options of the langauge server
nnoremap <leader>lo :call LanguageClient_contextMenu()<CR>
" see the signature of a method[
nnoremap <silent> <leader>ss :call LanguageClient#textDocument_hover()<CR>
" go to the definition
nnoremap <silent> <leader>def :call LanguageClient#textDocument_definition()<CR>
"rename all occurences of the given function
nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>


" xnoremap p "_dP

let g:vim_json_syntax_concealcursor = 1
let g:rooter_change_directory_for_non_project_files = 'home'

runtime! ftplugin/man.vim

let g:NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:highlightedyank_highlight_duration = 15000

nnoremap <leader>p "0p
nnoremap <leader>P "0P
xnoremap <leader>p "0p
xnoremap <leader>P "0P
nnoremap <leader>vn :vnew<CR>

" Time in milliseconds (default 250)
let g:Illuminate_delay = 250
" hi illuminatedWord cterm=underline gui=underline

fun! WordUnderCursorCount(args)
	execute ":%s@\\<" . expand("<cword>") . "\\>\@&@gn"
endfun
command! -nargs=* WordUnderCursorCount call WordUnderCursorCount( '<args>' )



" settings for light color solarized
fun! PersonalHighlights()
	""" this changes where mainly made to make the solarized light them
	""" better for use for getting a better sense of the options do a
	""" :h ColorColumn

    if g:theme == "light"
        highlight Cursor ctermbg=NONE cterm=bold
        highlight CursorColumn ctermbg=Yellow cterm=bold
        highlight CursorLine ctermbg=white
        highlight ALEErrorSign ctermbg=NONE ctermfg=red
        highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        set hlsearch
        hi Folded ctermbg=white
        " highlight LineNr ctermbg=white
        hi VertSplit ctermbg=white
        hi illuminatedWord cterm=underline gui=underline
        hi StatusLine ctermbg=darkgrey ctermfg=white
        hi StatusLineNC ctermbg=darkgrey ctermfg=white
        highlight clear SignColumn
        highlight SignColumn ctermbg=white
        highlight FoldColumn ctermbg=white
        highlight ColorColumn ctermbg=white

        highlight Pmenu ctermfg=white
        highlight PmenuSel ctermfg=white
        highlight PmenuSbar ctermfg=white
        highlight QuickFixLine ctermfg=white
        highlight TabLine ctermbg=white
        highlight TabLineFill ctermbg=white
        highlight TabLineSel ctermbg=white
    else
        highlight SignColumn ctermbg=black
        highlight FoldColumn ctermbg=black
        highlight ColorColumn ctermbg=black

    endif

endfun


if g:theme == 'dark'
	set background=dark
else
	set background=light
endif

call PersonalHighlights()


"writer mode {{{

fun! WritingMode()
    :Goyo
endfun
command! -nargs=* WritingMode call WritingMode()
map <Leader>wm :call WritingMode()<cr>
"}}}
"
"
function! s:goyo_leave()
	call PersonalHighlights()
endfunction

autocmd! User GoyoLeave call <SID>goyo_leave()



" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab


"  how to paste on multiple selections without messing up https://trello.com/c/WR8J9HAQ
"


" project specific settings {{{
fun! TravelerFrontend()
    set tabstop=2 shiftwidth=2
endfun
autocmd BufNewFile,BufRead */traveler-frontend/* call TravelerFrontend()

fun! Fishfarm()
    set tabstop=4 shiftwidth=4
endfun
autocmd BufNewFile,BufRead */gyg/* call Fishfarm()
autocmd BufNewFile,BufRead */fishfarm/* call Fishfarm()

"}}}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview="Always"
" let g:LanguageClient_useFloatingHover=1
"



autocmd BufEnter *.py,*.php let g:timer = timer_start(4000, 'AnnotatheCurrentWord',{'repeat':-1})
autocmd BufLeave *.py,*.php call timer_stop(g:timer)

let g:old_pos = getpos(".")
func! AnnotatheCurrentWord(timer)
  let new_pos =  getpos(".")


  if (new_pos == g:old_pos)

      let char_tmp1 = getline('.')[col('.') - 1:]
      if ! char_tmp1
          return
      endif
      let char_tmp = strgetchar(char_tmp1, 0)
      if ! char_tmp
          return
      endif
      let char_under_cusor = nr2char(char_tmp)
      let match = matchstr(char_under_cusor, '[A-Za-z0-9].')
      if !empty(match)
          :call LanguageClient#textDocument_hover()
      endif

  endif
  let g:old_pos = new_pos
endfunc

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction
:set path+=/home/jean/projects/personalscripts


"yaml specific {{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}
"php_cs_fixer_options
"
""force all tpl to be treated like html
" autocmd BufNewFile,BufRead *.tpl set syntax=html
let g:dispatch_compilers = {}
" let g:dispatch_compilers['./vendor/bin/']
let g:dispatch_compilers['phpunit'] = './vendor/bin/phpunit'


" fun! RunQbq(str)
"     :VimuxRunCommand('dbq ')
"     :VimuxRunCommand('echo "' . a:str . '" | dbq ')
" endfunction

" call toop#mapFunction('RunQbq', '<leader>dq')

