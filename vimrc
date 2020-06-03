" Welcome to my vim
"
" ## Conventions
" Comments about code should go above the code now below
" Every non obvious change should be commited. I really forget after a while
" Userspace dependencies par
" Changelog
" Files that complete this setup
" vim/plugin/ide.vim
" vim/plugin/toop_text_objects.vim
" vim/plugin/theme.vim
" vim/plugin/fzf.vim
"
" - Tue 21 May 2019 09:28:46 AM CEST - drop gist support because they are dangerous security-wise
" plugins load {{{
set nocompatible
filetype on
filetype plugin on "loading the plugin files for specific file types
call plug#begin()
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'altercation/vim-colors-solarized'
"Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'w0rp/ale'
Plug 'pgr0ss/vim-github-url'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-user' "enable the creation of custom text objects
"same indentation text object
Plug 'michaeljsmith/vim-indent-object'
"grep like sublime one
Plug 'dyng/ctrlsf.vim'
"quoting/parenthesizing
Plug 'tpope/vim-surround'
"shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
" this plugin is slow when the project is too big
"most recently used files list
Plug 'git@github.com:skywind3000/asyncrun.vim.git'
""" Tue 25 Feb 2020 10:18:46 PM CET add back startify because home screen also
""" very useless
" Plug 'mhinz/vim-startify'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'benmills/vimux'
" removed because i do not use it enough
" Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
"autocomplete pairs chars
Plug 'raimondi/delimitmate'
""" Tue 25 Feb 2020 10:17:59 PM CET added back airline because the real status
""" line is pretty useless and I don't see when I will customize it

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" removed because I do no use it enough
Plug 'Xuyuanp/nerdtree-git-plugin'
""to get the recent opened files
"Plug 'mhinz/vim-startify'
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
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/echodoc.vim'
" Plug 'codota/tabnine-vim', {'for': ['python', 'php']}
" Plug 'autozimu/LanguageClient-neovim', {
" 			\ 'branch': 'next',
" 			\ 'do': 'bash install.sh',
" 	 		\ }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" autocompletion {{{

"ncm2 is better than  deoplete :)

Plug 'ncm2/ncm2'
"Yet Another Remote Plugin Framework for Neovim
Plug 'roxma/nvim-yarp'
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
" Plug 'wellle/tmux-complete.vim'
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
Plug 'bps/vim-textobj-python', {'for': ['python']}
Plug 'wellle/targets.vim'


" programming languages {{{
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins', 'for': ['scala'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'Rican7/php-doc-modded', { 'for': ['php'] }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': ['php'] }
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
"filetype only * (for swift)
" Plug 'keith/swift.vim', {'for': ['swift']}
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
"hides links paths, and other small niceties
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs', 'for': ['php']}
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
Plug 'ludovicchabant/vim-gutentags', { 'for': ['c'] }
""seeing git log and git diff - I kind of prefer to handle git stuff in the shell
"gblame is necessary though
Plug 'tpope/vim-fugitive'
"marks search matching parts while typing - not really important
" Plug 'markonm/traces.vim'
Plug 'sheerun/vim-polyglot'
" go to github
Plug 'ruanyl/vim-gh-line'
Plug 'majutsushi/tagbar', {'for': ['python']}
Plug 'codota/tabnine-vim', {'for': ['python', 'php']}
"}}}
call plug#end()
"}}}

" Or, you could use neovim's virtual virtual text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
" {{{ generic
set wildignore+=*\\dist\\**
" set relativenumber

set wildmode=longest,list,full
set wildmenu
""" }}}

let mapleader = "\<space>"

"Tue 19 Nov 2019 12:06:15 PM CET disable mosue due to it fucking up my clipboard selection
set mouse=n "enable mouse on normal,visual,inter,command-line modes
"https://code.google.com/p/iterm2/issues/detail?can=2&start=0&num=100&q=&colspec=ID%20Type%20Status%20Priority%20Milestone%20Owner%20Summary&groupby=&sort=&id=1830
if has('mouse_sgr')
  set ttymouse=sgr
endif
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
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <silent> <leader>ve :e $MY_VIMRC<cr>:lcd %:h<cr>

" set shellcmdflag=-ic "make vim :! behave like a normal prompt
nnoremap <leader><space> :w<cr>
"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
noremap <leader>qq :q!<cr>
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

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set noshowmode

"do not give errors when opening files with swap open
set shortmess+=A

inoremap <c-c> <ESC>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


" }}}


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
set spelllang=en,de_de,pt_br
"}}}
"undo {{{ set undofile "enable undoing
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
" set shortmess+=A "don't give the "ATTENTION" message when an existing swap file is found
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
" set shortmess+=c
" Use <TAB> to select the popup menu: ncm2
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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
nnoremap <leader><C-f> :CtrlSF


" templates for filetypes {{{
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
"}}}



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

"}}}


" {{{ search
set hlsearch " match while typing the search
set ignorecase "the case of normal letters is ignored
set incsearch "show the next match while entering a search
" set ignorecase "the case of normal letters is ignored
set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters

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

"}}}


fun! ShowStringOnNewWindow(content)
    split _output_
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(a:content, '\v\n'))
endfun

fun! NotifySend(content)
    :Asyncrun notify-send '".a:content."'"
endfun

"tags {{{
set tags=./tags
let g:gutentags_ctags_extra_args=["--fields=+aimlS"]
let g:gutentags_ctags_executable="myctags"
let g:gutentags_ctags_exclude_wildignore=0
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

" windows management {{{
nmap <leader>vn :vnew<cr>
nnoremap <leader>on :only<cr>
set splitright "split new windows to the right
let g:resize_count = 19
let g:vim_resize_disable_auto_mappings = 1
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
"increase redraw time, performance tweak for for big files
set redrawtime=10000
syntax sync fromstart




let g:vim_json_syntax_concealcursor = 1
let g:rooter_change_directory_for_non_project_files = 'home'

runtime! ftplugin/man.vim

let g:NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup = 1
""" do I use this shit at all? {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""" }}}
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




" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab


"  how to paste on multiple selections without messing up https://trello.com/c/WR8J9HAQ


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

:set path+=/home/jean/projects/personalscripts


"yaml specific {{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}



fun! SwapEditors(path)
    :echo "Opening file on editor: ".a:path
    execute 'AsyncRun openOnVim "'.a:path.'" vim'
endfun
command! -nargs=* SwapEditors call SwapEditors(expand('%:p'))
nnoremap <Leader>i :SwapEditors<cr>


let test#python#runner#options = ' --show-capture=all '
let test#python#options = ' --show-capture=all '

let g:jupytext_enable = 1
let g:jupytext_command = 'jupytext'
"let g:jupytext_print_debug_msgs = 1
let g:jupytext_fmt = 'md'
let g:jupytext_to_ipynb_opts = '--to=ipynb --update'
let g:jupytext_filetype_map = {'md': 'pandoc'}
au BufRead,BufNewFile *.ipynb set filetype=python

nnoremap <Leader>pdoc :Pydocstring<cr>

"""<cr>

nnoremap <Leader>tt :TagbarToggle<CR>
