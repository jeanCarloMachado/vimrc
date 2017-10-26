"It's a good practise to use folding to hide details of
"Its better to organize the configs by semantic. Better to put wiki
"mappings on the wiki section then on the mappings section

"Plugins Load {{{
filetype on
filetype plugin on
call plug#begin()
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-utils/vim-man' "view manuals inside vim
Plug 'kana/vim-textobj-user' "enable the creation of custom text objects
Plug 'kana/vim-textobj-function' "text object for a function: enables af and if
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' "gist support
Plug 'michaeljsmith/vim-indent-object' "same identation text object
Plug 'vim-scripts/argtextobj.vim'
Plug 'dyng/ctrlsf.vim' "grep like sublime one
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim' "writer mode
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'wakatime/vim-wakatime'
Plug 'lervag/vimtex', { 'for': [ 'latex' ] }
Plug 'kovisoft/slimv', { 'for': [ 'lisp' ] }
Plug 'ElmCast/elm-vim', { 'for': [ 'elm' ] }
Plug 'fatih/vim-go', { 'for': [ 'go'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
call plug#end()
"}}}

"generic configs{{{
set nocompatible
let mapleader = "\<space>"
runtime macros/matchit.vim "Enable extended % matching
set tags+=/usr/include/tags,./tags,./.git/tags,../.git/tags
set mouse=a "enable mouse on normal,visual,inter,command-line modes
set splitbelow "When on, splitting a window will put the new window below the current
set backspace=indent,eol,start "make the backspace work like in most other programs
set cot+=menuone "Use the popup menu also when there is only one match
set number "show numbers
set shell=$SHELL
set encoding=utf-8
set showmode "If in Insert, Replace or Visual mode put a message on the last line
set showcmd "Show (partial) command in the last line of the screen
set hidden "hides buffers instead of closing them
set laststatus=2 "when the last window will have a status line: 2: always
set gdefault "When on, the :substitute flag 'g' is default on
set showmatch "show matching parenthesis
set scrolloff=0 " Minimum lines to keep above and below cursor"
set autoread "automaically read a file again when it's changed outside vim
set history=5000 "the quantity of normal commands recorded
set title "When on, the title of the window will be set to the value of 'titlestring'
vnoremap . :normal .<CR> "Allow using the repeat operator with a visual selection
setlocal formatoptions=1
set formatprg=par "The name of an external program that will be used to format the lines selected with the |gq| operator.
setlocal linebreak "wrap long lines at a character in 'breakat'
set clipboard=unnamedplus
let g:abolish_save_file = '/home/jean/.vim/abbreviations.vim'
"set scrolloff=3 "alway 3 lines instead of reaching bottom uppper screen
"}}}

" search{{{
set hlsearch " match while typing the search
set incsearch "show the next match while entering a search
set ignorecase "the case of normal letters is ignored
set smartcase "Override the 'ignorecase' option if the search pattern contains upper case characters
"}}}

" autocomplete {{{
set wildmenu
inoremap <S-Tab> <C-X><C-F>
set wildmode=longest,list
"}}}

"Fold {{{
set foldenable
set foldcolumn=1
set foldlevel=1 "control the level to be opened by default (this opens just the first h1, levels)
set foldmethod=marker
"autocmd BufRead * setlocal foldmethod=marker
" autocmd BufRead * normal zM
"}}}

"Concealing {{{
autocmd FileType php call matchadd('Conceal', '!=', 999, -1, {'conceal': '≠'})
autocmd FileType php call matchadd('Conceal', '->', 999, -1, {'conceal': '➞'})
autocmd FileType php call matchadd('Conceal', '=>', 999, -1, {'conceal': '➞'})
autocmd FileType markdown call matchadd('Conceal', '# ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '## ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '### ', 999, -1, {'conceal': ''})
autocmd FileType markdown call matchadd('Conceal', '#### ', 999, -1, {'conceal': ''})
set conceallevel=2 "show pretty latex formulas
"}}}

"Grep {{{
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
fun! Grepr( arg )
    execute "grep " . a:arg . " %:p:h/*"
endfun
command! -nargs=* Grepr call Grepr( '<args>' )
"}}}

"netrw{{{
nnoremap <leader>k :Vexplore<cr>
let g:netrw_winsize = 25 "window width
let g:netrw_browse_split=4 "open on the previous window
let g:netrw_altv=1 "open vertical splits on the right
"}}}

"spelling {{{
fun! FixLastSpellingError()
    normal! mm[s1z=`m
endfun

nnoremap <leader>fs :call FixLastSpellingError()<cr>
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
"}}}

"Generic functions{{{
fun! WritingMode()
    :Goyo
    "execute "!notify-send 'test'"
endfun
command! -nargs=* WritingMode call WritingMode()
map <Leader>wm :call WritingMode()<cr>
let writer_mode=$WRITER_MODE

fun! LatestPost()
    let out =  system("run_function latestPost")
    execute 'edit' out
endfun
command! -nargs=* LatestPost call LatestPost()

fun! Talk()
    :e $WIKI_PATH/talks.md
endfun
command! -nargs=* Talk call Talk()

fun! Glossary()
    :e $WIKI_PATH/glossary.md
endfun
command! -nargs=* Glossary call Glossary()

fun! Remember()
    :e /home/jean/.remember
endfun
command! -nargs=* Remember call Remember()

fun! Functions()
    :e /home/jean/projects/dotfiles/functions.sh
endfun
command! -nargs=* Functions call Functions()

fun! Quotes()
    :e /home/jean/Dropbox/wiki/src/quotes.md
endfun
command! -nargs=* Quotes call Quotes()

fun! Meditation()
:e $WIKI_PATH/meditation/meditation.md
endfun
command! -nargs=* Meditation call Meditation()

fun! Date()
:e $WIKI_PATH/pua/personal_history.md
endfun
command! -nargs=* Date call Date()

if !exists('*ReloadVim')
fun! ReloadVim()
     silent source $MY_VIMRC
     execute "edit %"
 endfun
command! -nargs=* ReloadVim call ReloadVim()
nmap <silent> <leader>sv :ReloadVim<cr>
endif
"}}}

"Generic mappings{{{
nnoremap <leader>ls  :ls<cr>
nnoremap <leader>gv  :! gvim %:p<cr>
nnoremap <leader>; :normal!mtA;<esc>`t
nnoremap <leader>, :normal!mtA,<esc>`t
nnoremap <BS> :Rex<cr>
nnoremap <leader>fi :CtrlSF 
nnoremap + ddp
nnoremap _ dd2kp
nnoremap <Leader>le :noh<cr>
nnoremap <Leader>dt :r ! date<cr>
nnoremap <Leader>e :edit!<cr>
nnoremap <Leader>o :only<cr>
nnoremap cwi ciw
map <leader>i mmgg=G`m
map <leader>x :w<','> !bash<cr>
map <leader>me :!chmod +x %<cr>
nnoremap <leader>tn :tabnew<cr>
"open director (file manager)
nmap <leader>sh :!cd %:h && zsh <cr>
nmap <leader>rmrf :!rm -rf %:p <cr> "remove current  file
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <silent> <leader>ev :e $MY_VIMRC<cr>:lcd %:h<cr>
nnoremap <leader>c :noh<cr>
"set shellcmdflag=-ic "make vim :! behave like a normal prompt
nnoremap <leader><space> :w<cr>
"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
nnoremap <C-c> :q!<cr>
cnoremap <C-n> <Down>
" use %% to expand to the current buffer directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>cf :!filefy-clippboard<cr>
" Default fzf layout
map <c-p> :FZF<cr>
"}}}

"performance {{{
set ttyfast "Improves smoothness of redrawing when there are multiple windows
autocmd BufEnter * :syn sync maxlines=500
set lazyredraw "don't redraw screend when running macros
syntax sync minlines=256
set nocursorcolumn "disable the highlight of the screen column of the cursor
"disables syntax for files going over a certain size
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
"}}}

"undo {{{
"enable undoing
set undofile
set undodir=/home/jean/.vim/undo/
set undolevels=1000
set undoreload=10000
"}}}

" backup options{{{
set backup
set writebackup
set backupdir=/home/jean/.vim/backup
"don't clutter dirs with swp and tmpfiles

set swapfile
set directory=/home/jean/.vim/swap
"don't show alert message when the swap already exists
set shortmess+=A "don't give the "ATTENTION" message when an existing swap file is found
"}}}

"indenting {{{
filetype plugin indent on
set copyindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd filetype javascript set tabstop=2
autocmd filetype javascript set shiftwidth=2
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
"
"actions over text blocks{{{
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

fun! s:ComputeMD5(str)
  let out = system('md5sum |cut -b 1-32', a:str)
  " Remove trailing newline.
  let out = substitute(out, '\n$', '', '')
  return out
endfun
call MapAction('ComputeMD5','<leader>M')

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
      let out = system('translate ', a:str)
      return out
  endfun
call MapAction('Translate', '<leader>ti')

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

fun! s:Filefy(str)
  let out = system('filefy ', a:str)
  return out
endfun
call MapAction('Filefy', '<leader>fly')

fun! s:BreakCommand(str)
  let out = system('run_alias break_command ', a:str)
  return out
endfun
call MapAction('BreakCommand', '<leader>bc')

fun! s:foldSomething(str)
    return "{{{".a:str."}}}"
endfun
call MapAction('foldSomething', '<leader>fo')

fun! s:Trim(str)
  let out = system('run_function trim ', a:str)
  return out
endfun
call MapAction('Trim', '<leader>tr')

fun! s:googleIt(str)
    let out = system('google_it', a:str)
endfunc
call MapAction('googleIt', '<leader>gi')

fun! s:getHelp(str)
    let my_filetype = &filetype
    let out = system('getHelp.sh '.my_filetype, a:str)
endfunc
call MapAction('getHelp', '<leader>h')

"render a html chunk on the browser
fun! s:BCat(str)
    let out = system('browser-cat ', a:str)
endfunc
call MapAction('BCat', '<leader>vi')

fun! s:Decode(str)
  let out = system('url-decode ', a:str)
  return out
endfunc
call MapAction('Decode', '<leader>d')

fun! s:Interpret(str)
    let out = system('ruby-interpreter ', a:str)
    return out
endfunc
call MapAction('Interpret', '<leader>r')

fun! s:Lisp(str)
    let out = system('sbcl_snippet', a:str)
    return out
endfunc
call MapAction('Lisp', '<leader>li')

fun! s:ToCamelCase(str)
    let out = ChompedSystemCall('run_function toCamelCase', a:str)
    return out
endfunc
call MapAction('ToCamelCase', '<leader>tc')

fun! s:ToSnakeCase(str)
    let out = ChompedSystemCall('run_function toSnakeCase', a:str)
    return out
endfunc
call MapAction('ToSnakeCase', '<leader>ts')

fun! s:JsonBeautifier(str)
  let out = system('run_function json_beautifier ', a:str)
  return out
endfunc
call MapAction('JsonBeautifier', '<leader>jb')

fun! s:JsonEncode(str)
  let out = system('json_encode_from_php', a:str)
  return out
endfunc
call MapAction('JsonEncode', '<leader>pj')

fun! s:UrlToJson(str)
  let out = system('url-to-json ', a:str)
  return out
endfunc
call MapAction('UrlToJson', '<leader>ju')

fun! s:OpenSelectedUrl(str)
  silent call OpenUrl(a:str)
endfunc
call MapAction('OpenSelectedUrl', '<leader>ol')
call MapAction('OpenSelectedUrl', '<leader>ou')

fun! s:Alnum(str)
  let out = system('run_function alnum ', a:str)
  return out
endfunc
call MapAction('Alnum', '<leader>a')

fun! s:Unescape(str)
  let out = system('sed "s/\\\//g" ', a:str)
  return out
endfunc
call MapAction('Unescape', '<leader>us')

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

"Markdown{{{
let g:vim_markdown_no_extensions_in_markdown = 1
autocmd Filetype markdown call MarkdownDefaultConfigs()
highlight Folded ctermfg=DarkYellow

fun! MarkdownDefaultConfigs()
    set tw=80 "80 columsn are more than enough
    set syntax=markdown
    set spell spelllang=en_us
endfunc

"this feature is from vim and it supports the latex syntax so look at the
"latex reference to know how to use it
let g:vim_markdown_math = 1
"syntax highlight for markdown
let g:vim_markdown_fenced_languages = ['html', 'py=python', 'bash=sh', 'c', 'php', 'hs=haskell', 'elm', 'li=lisp']
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
au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr

fun! s:Italic(str)
    return '*'.a:str.'*'
endfunc
call MapAction('Italic', '<leader>i')

fun! s:Bold(str)
    return '**'.a:str.'**'
endfunc
call MapAction('Bold', '<leader>bo')

fun! s:Highlight(str)
    return '***'.a:str.'***'
endfunc
call MapAction('Highlight', '<leader>hl')


fun! s:CodeBlock(str)
    return "```sh\n".a:str."\n```"
endfunc
call MapAction('CodeBlock', '<leader>c')

fun! s:MarkdownToHtml(str)
    let file_name_without_extension = system('md5sum  | run_function alnum ', expand("%:r"))
    let out = system('pandoc -o /tmp/'.file_name_without_extension.'.html ',a:str)
    silent execute '! browser /tmp/'.file_name_without_extension.'.html 1>/dev/null & '
endfunc
call MapAction('MarkdownToHtml', '<leader>mh')

"}}}

"diary{{{
nnoremap <Leader>di :Today<cr>
nnoremap <Leader>to :Today<cr>
fun! Diary( arg )
    let out = system('run_function diary_file "' . a:arg . '"')
    execute "edit " . out
endfunc

command! -nargs=* Tomorrow call Diary( 'tomorrow' )
command! -nargs=* Yesterday call Diary( 'yesterday' )
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

"task manager {{{
fun! s:MarkDone(str)
  let out = system('sed -r "s/(○ |◎ )//g; s/(.*)/● \1/g" ', a:str)
  return out
endfunc
call MapAction('MarkDone', '<leader>md')

fun! s:MakeTask(str)
  let out = system('sed -r "s/(◐ |◎ )//g; s/(.*)/○ \1/g" ', a:str)
  return out
endfunc
call MapAction('MakeTask', '<leader>mt')

fun! s:MakeApointment(str)
  let out = system('sed -r "s/(.*)/◐ \1/g" ', a:str)
  return out
endfunc
call MapAction('MakeApointment', '<leader>ma')

fun! s:MakeSomeday(str)
  let out = system('sed -r "s/(◐ |○ )//g; s/(.*)/◎ \1/g" ', a:str)
  return out
endfunc
call MapAction('MakeSomeday', '<leader>ms')
"}}}

"wiki{{{
"map <ci> :FZF $CLIPP_PATH <cr>
map <c-i> :FZF $WIKI_PATH<cr>
let g:vim_markdown_no_default_key_mappings = 1
fun! Wiki(arg)
    let wiki_path = $WIKI_PATH
    if a:arg == 'compufacil'
        let wiki_path = "/home/jean/projects/compufacil/Docs/src"
    endif
    "sets the current directory of the window localy to enable file searches
    execute "lcd " . wiki_path
    execute "edit " . wiki_path . "/index.md"
endfunc
command! -nargs=* Wiki call Wiki( '<args>' )
command! -nargs=* WikiCompufacil call Wiki( 'compufacil' )
command! -nargs=* CompufacilWiki call Wiki( 'compufacil' )
command! -nargs=* Quote :e $WIKI_PATH/quotes.md

nnoremap <Leader>ww :Wiki<cr>
nnoremap <Leader>wc :WikiCompufacil<cr>
nnoremap <Leader>cw :WikiCompufacil<cr>

fun! GetUrl()
    normal! $F(vi(y
    return @"
endfunc
fun! GetLine()
    normal! yy
    return @"
endfunc

fun! OpenMarkdown()
    let url = GetUrl()
    let path = expand('%:p:h')
    execute 'edit ' . path . '/' . url . '.md'
endfunc

fun! OpenFile()
    let line = GetLine()
    if ( line =~ "http" )
        let url = GetUrl()
        :call OpenUrl(url)
    endif

    if ( line != "\n" )
        :call OpenMarkdown()
    endif
endfun
autocmd FileType markdown nnoremap <CR> :call OpenFile()<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

fun! OpenUrl(url)
    silent execute '! $BROWSER "' . a:url . '" 1>/dev/null  &'
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

"files templates matching {{{
autocmd BufNewFile *Test.php 0r $TEMPLATES_DIR/php_test.php
autocmd BufNewFile *.php 0r $TEMPLATES_DIR/php.php
autocmd BufNewFile *.sh 0r $TEMPLATES_DIR/shell.sh
autocmd BufNewFile *.html 0r $TEMPLATES_DIR/html.html
autocmd BufNewFile *.c 0r $TEMPLATES_DIR/c.c
autocmd BufNewFile **/papers/*.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile **/*_paper.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile **/*review*.md 0r $TEMPLATES_DIR/science-review.md
autocmd BufNewFile */diary/*.md 0r $TEMPLATES_DIR/diary.md
autocmd BufNewFile */posts/*.md 0r $TEMPLATES_DIR/post.md
"}}}

"info relative to projects file, metadata{{{
nmap <leader>xo :!xdg-open % &<cr>
nmap <leader>od :!run_alias file_manager %:h<cr>
"copy path name
nmap <leader>cpn :!copy %:p<cr>
"copy full name
nmap <leader>cfn :!copy %:p<cr>
fun! SaveForcing()
     execute "w !sudo tee > /dev/null %"
 endfunc
command! -nargs=* ForceSave call SaveForcing()
command! -nargs=* SaveForce call SaveForcing()
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


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
"}}}

"git {{{
fun! GitLog()
    execute '!run_function terminal_run "cd $(dirname %:p) ; git log -p --follow %:p" &'
endfunc
nmap <leader>gk :call GitLog()<cr>

fun! FzfContent()
    execute ':!cd  '.$PWD.' ;  fzf_content > /tmp/fzf_current '
    redraw!
    let out = system('cat /tmp/fzf_current')
    execute 'edit '.out
endfunc
map <c-s> :call FzfContent()<cr>

map <leader>ck :!git checkout %<cr>
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
    let result = system("$BROWSER " . url . " & ")
endfunc
command! -nargs=* GithubRepo call OpenRepoOnGithub( '<args>' )
"}}}

"PHP{{{
fun! ShowStringOutput(content)
    split _output_
    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(a:content, '\v\n'))
endfun
fun! RunCurrentPHPFile()
  let linterOut = system('php -l ' . expand("%:p"))
  let executionOut = system('php ' . expand("%:p"))
  call ShowStringOutput(linterOut."\n\n".executionOut)
endfunc
noremap <Leader>pr :call RunCurrentPHPFile()<cr>

fun! s:JsonToPhp(str)
  let out = system('json-to-php ', a:str)
  return out
endfun
call MapAction('JsonToPhp', '<leader>jp')

command Phpcsfixer : ! php-code-check `pwd`/%
    \ || print "Error on code check" && sleep 10


fun! RunPHPUnitTest(filter)
    cd %:p:h
    let test_command = "phpunit -c ". $CLIPP_PATH . "/Backend/phpunit.xml.dist " . expand("%:p")

    if a:filter
        normal! T yw
        if @" =~ "^test*"
            normal! mT
        endif

        normal! `T
        normal! T yw
        let test_command="phpunit -c ". $CLIPP_PATH ."/Backend/phpunit.xml.dist " . expand("%:p") . " --filter " . @" . " "
    else
        let @n = expand('%:t')
        if @n =~ "Test"
            normal! mA
        endif
        normal! `A
    endif

    let result = system(test_command)
    let output = test_command  . "\n\n" . result

    call ShowStringOutput(output)
    cd -
endfun
nnoremap <leader>u :call RunPHPUnitTest(0)<cr>
nnoremap <leader>f :call RunPHPUnitTest(1)<cr>
autocmd filetype php nnoremap <leader>s :Phpcsfixer<cr>
"}}}

" gvim {{{
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guifont=DejaVu\ Sans\ Mono\ 14
" }}}

" macros {{{
fun! RepeatAndMove()
    let @q ="n."
    normal! @q
endfun
nnoremap <leader>rm :RepeatAndMove(<cr>
command! -nargs=* RepeatAndMove call RepeatAndMove()
" }}}

" C lang {{{
fun! CFiletypeConfigs()
    "compile through gcc when there's no makefile
    if !filereadable(expand("%:p:h")."/Makefile")
        setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
    endif
endfun
autocmd filetype c call CFiletypeConfigs()
"}}}

"statusline{{{
set statusline=
set statusline +=\ %n\             "buffer number
set statusline +=\ %<%F            "full path
set statusline +=%m                "modified flag
set statusline +=%=%5l             "current line
set statusline +=/%L               "total lines
set statusline +=%4v\              "virtual column number
set statusline +=U%04B\           "character under cursor
"}}}

"cursorline{{{
"set cursorline "show the cursor line
"autocmd ColorScheme * highlight CursorLine ctermbg=0 "cursorline theme
"}}}

"theme, colors, highlights {{{
syntax enable
set background=dark
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

colorscheme solarized
hi StatusLine ctermfg=12 ctermbg=0 cterm=NONE
set term=screen-256color
let g:solarized_bold=1
set t_Co=256
"}}}

" vimrc per project {{{
set exrc "enable vimrc per project
set secure "disable unsecure options
"}}}

" windows {{{
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
" }}}

"compufacil settings {{{
fun! OpenTest()
  let original_file = fnamemodify(expand("%"), ":~:.")

  "mark position as service
  normal! mS
  let out = system('echo "'.original_file.'" | run_function testFromService')
  execute 'edit '.out

  "mark position as test
  normal! mT
endfunc
map <Leader>ot :call OpenTest()<cr>

fun! OpenService()
  let original_file = expand('%')

  "mark position as service
  normal! mS
  let out = system('echo "'.original_file.'" | run_function serviceFromTest')
  execute 'edit '.out

  "mark position as service
  normal! mT
endfunc
map <Leader>os :call OpenService()<cr>
"}}}

let g:slimv_impl = 'sbcl'
"if exists("relativenumberformat")
"    set relativenumber
"    "the final space is proposital
"    set relativenumberformat=%-*ld\ 
"endif

