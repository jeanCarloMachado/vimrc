"It's a good practise to use folding to hide details of
"Its better to organize the configs by semantic. Better to put wiki
"mappings on the wiki section then on the mappings section
"Plugins Load {{{
filetype on
filetype plugin on
call plug#begin()

Plug 'fatih/vim-go', { 'for': [ 'go'] }
"document completion, text objectsic ac Commands id ad Delimiters ie ae LaTeX environments i$ a$ Inline math structures
Plug 'lervag/vimtex', { 'for': [ 'latex' ] }
Plug 'ElmCast/elm-vim', { 'for': [ 'elm' ] }
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'jez/vim-superman'
"enable the creation of custom text objects
Plug 'kana/vim-textobj-user'
"text object for a function: enables af and if
Plug 'kana/vim-textobj-function'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
"ghc depends on vimproc
Plug 'Shougo/vimproc.vim', {'do' : 'make'} | Plug 'eagletmt/ghcmod-vim', { 'for': ['haskell'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'vim-scripts/argtextobj.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-syntastic/syntastic', { 'for': ['c', 'bash', 'haskell', 'make' ] } "syntax checking
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'vim-scripts/tinymode.vim' | Plug 'breuckelen/vim-resize'
Plug 'majutsushi/tagbar' | Plug 'jszakmeister/markdown2ctags', { 'for': ['markdown'] }
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'Shougo/neocomplete'
call plug#end()
"}}}

"generic configs{{{
syntax enable
let mapleader = "\<space>"
runtime macros/matchit.vim
set tags+=/usr/include/tags,./tags,./.git/tags,../.git/tags
set mouse=a
set nrformats= "vim will treat all numerals as decimals, useful on num<C-a> with numbers like 007
set splitbelow
set backspace=indent,eol,start
set cot+=menuone
set number
set shell=/bin/zsh
set encoding=utf-8
set showmode
set showcmd
"hides buffers instead of closing them
set hidden
set wildmode=longest,list
set ttyfast
set ruler
set laststatus=2
set hlsearch " match while typing the search
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch "show matching parenthesis
set scrolloff=0 " Minimum lines to keep above and below cursor"
set autoread
set history=1000 "the quantity of normal commands recorded
set title
vnoremap . :normal .<CR> " Allow using the repeat operator with a visual selection
set cursorline
set wildignore=*.swp,*.back,*.pyc,*.class,*.coverage.*
setlocal formatoptions=1
set formatprg=par
setlocal linebreak
set clipboard=unnamedplus
set nocompatible
let g:abolish_save_file = '/home/jean/.vim/abbreviations.vim'
"}}}

" backup options{{{
set swapfile
set backup
set writebackup
set backupdir=~/.vim_tmp
set directory=~/.vim_tmp "don't clutter dirs with swp and tmpfiles
"don't show alert message when the swap already exists
set shortmess+=A
"}}}

"Fold {{{
set foldenable
set foldcolumn=4
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
set grepprg=ack\ -i\ --column\ $*
set grepformat=%f:%l:%c:%m
fun! Grepr( arg )
    execute "grep " . a:arg . " %:p:h/*"
endfunction
command! -nargs=* Grepr call Grepr( '<args>' )
"}}}
"netrw{{{
nnoremap <leader>k :Explore<cr>
nnoremap <leader>K :call ExploreCurrentBufferDirectory()<cr>
fun! ExploreCurrentBufferDirectory()
    let current_directory = expand('%:p:h')
    execute "Explore ".current_directory

endfunction

let g:netrw_localrmdir='rm -r'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_liststyle=3
let g:netrw_hide = 0
set browsedir=current
let g:netrw_banner = 0
"}}}
"spelling {{{
fun! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction

nnoremap <leader>ls :call FixLastSpellingError()<cr>
map <leader>spt :set spell spelllang=pt_br<cr>
map <leader>sen :set spell spelllang=en_us<cr>
"}}}
"autocompletion {{{
" set wildmenu "to autocomplete the suggestions like bash
" set completeopt=menu
" set complete+=s

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
"resize{{{
" call tinymode#EnterMap("winresize", "<leader>h", "h")
" call tinymode#Map("winresize", "h", "CmdResizeLeft")
" call tinymode#EnterMap("winresize", "<leader>l", "l")
" call tinymode#Map("winresize", "l", "CmdResizeRight")
" call tinymode#EnterMap("winresize", "<leader>k", "k")
" call tinymode#Map("winresize", "k", "CmdResizeUp")
" call tinymode#EnterMap("winresize", "<leader>j", "j")
" call tinymode#Map("winresize", "j", "CmdResizeDown")
" call tinymode#ModeMsg("winresize", "Change window size h/j/k/l") 
"}}}
"Generic functions{{{
fun! WritingMode()
    :Goyo
    "execute "!notify-send 'test'"
endfunction
command! -nargs=* WritingMode call WritingMode()
map <Leader>wm :call WritingMode()<cr>
let writer_mode=$WRITER_MODE

fun! Talk()
    :e $WIKI_PATH/talks.md
endfunction
command! -nargs=* Talk call Talk()

fun! Remember()
    :e /home/jean/.remember
endfunction
command! -nargs=* Remember call Remember()

fun! Quotes()
    :e /home/jean/Dropbox/wiki/src/quotes.md
endfunction
command! -nargs=* Quotes call Quotes()

fun! Meditation()
:e /home/jean/Dropbox/wiki/src/meditation/meditation.md
endfunction
command! -nargs=* Meditation call Meditation()



if !exists('*ReloadVim')
fun! ReloadVim()
     silent source $MY_VIMRC
     execute "edit %"
endfunction
command! -nargs=* ReloadVim call ReloadVim()
nmap <silent> <leader>sv :ReloadVim<cr>
endif

"}}}

"Generic mappings{{{
nnoremap <leader>gv  :! gvim %:p<cr>
nnoremap <leader>; :normal!mtA;<esc>`t
nnoremap <BS> :Rex<cr>
"to clear the search
nnoremap + ddp
nnoremap _ dd2kp
nnoremap <leader>tt :TagbarToggle<cr>
let g:tagbar_width=30
nnoremap <Leader>le :noh<cr>
nnoremap <Leader>fs :w ! sudo tee %<cr>
nnoremap <Leader>dt :r ! date<cr>
nnoremap <Leader>e :edit!<cr>
nnoremap <Leader>o :only<cr>
nnoremap cwi ciw
map <leader>i mmgg=G`m
map <leader>x :w<','> !bash<cr>
map <leader>me :!chmod +x %<cr>
nnoremap <leader>tn :tabnew<cr>
"open director (file manager)
nmap <leader>sh :!cd %:h && bash<cr>
"remove current  file
nmap <leader>rmrf :!rm -rf %:p <cr>
nmap <leader>pn :!echo %<cr>
nmap <leader>pfn :!echo %:p<cr>
nmap <silent> <leader>ev :e $MY_VIMRC<cr>:lcd %:h<cr>
nnoremap <leader>c :noh<cr>
nnoremap <leader><space> :w<cr>
"use C-p and C-n to browser normal mode commands history
cnoremap <C-p> <Up>
nnoremap <C-c> :q!<cr>
cnoremap <C-n> <Down>
" use %% to expand to the current buffer directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>cf :!filefy-clippboard<cr>
" Default fzf layout
" - down / up / left / right
map <c-p> :FZF<cr>
"}}}
"Highlight rules {{{

"use h cterm-colors to get the list of colors
augroup VimrcColors
au!
  autocmd ColorScheme * highlight WordsToAvoid ctermfg=DarkBlue cterm=underline
  autocmd ColorScheme * highlight HardWords ctermfg=DarkBlue cterm=underline
  autocmd ColorScheme * highlight Whitespace ctermbg=Grey
  autocmd ColorScheme * highlight Overlength ctermbg=DarkGrey
  autocmd ColorScheme * highlight SpellBad ctermfg=Brown
  "makes a underline on the current cursor line
  autocmd ColorScheme * highlight CursorLine cterm=underline ctermbg=NONE
augroup END

autocmd Syntax * call matchadd('WordsToAvoid', '\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|little\|quite\|everyone\knows\|however\|easy\|obviamente\|basicamente\|simplesmente\|com\certeza\|claramente\|apenas\|mais\|todos\sabem\|entretanto\|então\|fácil\|bem\)\>')
"words that need to be revised
autocmd Syntax * call matchadd('HardWords', '\c\<\(porquê\|porque\|por\sque\|its\)\>')
autocmd Syntax * call matchadd('Whitespace', '\s\+$')
autocmd Syntax * call matchadd('Overlength', '\%81v')
"}}}
"theme setting {{{
let theme=$THEME
if theme == 'light'
    set background=light
else
    set background=dark
endif

let g:airline_theme='solarized'
set term=screen-256color
let g:solarized_termcolors=16
let g:solarized_bold=1
set t_Co=256
colorscheme solarized
"}}}
"performance {{{
autocmd BufEnter * :syn sync maxlines=500
set lazyredraw "don't redraw screend when running macros
syntax sync minlines=256
set nocursorcolumn
set nocursorline
"disables syntax for files going over a certain size
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
"}}}
"undo {{{
set undodir=/home/jean/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
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
endfunction

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
endfunction


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
endfunction

fun! CurrentBarI()
  normal! T/
  let head_pos = getpos('.')
  normal! f/
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction


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
endfunction

fun! CurrentPipeI()
  normal! T|
  let head_pos = getpos('.')
  normal! f|
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

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
endfunction

fun! CurrentDocumentI()
  normal! ggj
  let head_pos = getpos('.')
  normal! G$k
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction
inoremap ;<cr> <end>;<cr>
"}}}
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

fun! s:ActionOpfunc(type)
  return s:DoAction(s:encode_algorithm, a:type)
endfunction

fun! s:ActionSetup(algorithm)
  let s:encode_algorithm = a:algorithm
  let &opfunc = matchstr(expand('<sfile>'), '<SNR>\d\+_').'ActionOpfunc'
endfunction

fun! MapAction(algorithm, key)
  exe 'nnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>ActionSetup("'.a:algorithm.'")<CR>g@'
  exe 'xnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",visualmode())<CR>'
  exe 'nnoremap <silent> <Plug>actionsLine'.a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",v:count1)<CR>'
  exe 'nmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'xmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'nmap '.a:key.a:key[strlen(a:key)-1].' <Plug>actionsLine'.a:algorithm
endfunction

fun! s:ComputeMD5(str)
  let out = system('md5sum |cut -b 1-32', a:str)
  " Remove trailing newline.
  let out = substitute(out, '\n$', '', '')
  return out
endfunction
call MapAction('ComputeMD5','<leader>M')

fun! s:ReverseString(str)
  let out = join(reverse(split(a:str, '\zs')), '')
  " Remove a trailing newline that reverse() moved to the front.
  let out = substitute(out, '^\n', '', '')
  return out
endfunction
call MapAction('ReverseString', '<leader>i')

fun! s:MathBlock(str)
    return '$ '.a:str.' $'
endfunction
call MapAction('MathBlock', '<leader>mb')

fun! s:Backtick(str)
    return "`".a:str."`"
endfunction
call MapAction('Backtick', "<leader>`")

fun! s:Quote(str)
    return "'".a:str."'"
endfunction
call MapAction('Quote', "<leader>'")

fun! s:DoubleQuote(str)
    return '"'.a:str.'"'
endfunction
call MapAction('DoubleQuote', '<leader>"')

fun! s:Tag(str)
    return '<'.a:str.'>'
endfunction
call MapAction('Tag', '<leader><')

fun! s:MakeList(str)
      let out = system('run_function prepend " - " ', a:str)
      return out
endfunction
call MapAction('MakeList', '<leader>ml')


fun! s:MakeNumberedList(str)
      let out = system('echo "'.a:str.'" | nl -s". " -w1')
      return out
endfunction
call MapAction('MakeNumberedList', '<leader>mnl')

fun! s:MakeGraph(str)
      let out = system('graph-easy', a:str)
      return a:str . "\n" . out
endfunction
call MapAction('MakeGraph', '<leader>mg')

fun! s:Parenthesis(str)
    return '('.a:str.')'
endfunction
call MapAction('Parenthesis', '<leader>(')

fun! s:Brackets(str)
    return '['.a:str.']'
endfunction
call MapAction('Brackets', '<leader>[')

fun! s:Filefy(str)
  let out = system('filefy ', a:str)
  return out
endfunction
call MapAction('Filefy', '<leader>fly')

fun! s:BreakCommand(str)
  let out = system('run_alias break_command ', a:str)
  return out
endfunction
call MapAction('BreakCommand', '<leader>bc')

fun! s:foldSomething(str)
    return "{{{".a:str."}}}"
endfunction
call MapAction('foldSomething', '<leader>fo')

fun! s:Trim(str)
  let out = system('run_function trim ', a:str)
  return out
endfunction
call MapAction('Trim', '<leader>tr')

fun! s:googleIt(str)
    let out = system('google-it &', a:str)
endfunction
call MapAction('googleIt', '<leader>gi')

fun! s:BCat(str)
    let out = system('browser-cat ', a:str)
endfunction
call MapAction('BCat', '<leader>v')

fun! s:MarkdownToHtml(str)
    let file_name_without_extension = system('md5sum  | run_function alnum ', expand("%:r"))

    let out = system('pandoc -o /tmp/'.file_name_without_extension.'.html ',a:str)
    silent execute '! browser /tmp/'.file_name_without_extension.'.html 1>/dev/null & '
endfunction
call MapAction('MarkdownToHtml', '<leader>mh')


fun! s:Decode(str)
  let out = system('url-decode ', a:str)
  return out
endfunction
call MapAction('Decode', '<leader>d')

fun! s:Interpret(str)
    let out = system('ruby-interpreter ', a:str)
    return out
endfunction
call MapAction('Interpret', '<leader>r')

fun! s:JsonBeautifier(str)
  let out = system('run_function json_beautifier ', a:str)
  return out
endfunction
call MapAction('JsonBeautifier', '<leader>jb')

fun! s:JsonEncode(str)
  let out = system('json-encode ', a:str)
  return out
endfunction
call MapAction('JsonEncode', '<leader>je')

fun! s:UrlToJson(str)
  let out = system('url-to-json ', a:str)
  return out
endfunction
call MapAction('UrlToJson', '<leader>ju')

fun! s:OpenSelectedUrl(str)
  silent call OpenUrl(a:str)
endfunction
call MapAction('OpenSelectedUrl', '<leader>ol')
call MapAction('OpenSelectedUrl', '<leader>ou')

fun! s:Alnum(str)
  let out = system('run_function alnum ', a:str)
  return out
endfunction
call MapAction('Alnum', '<leader>a')

fun! s:Unescape(str)
  let out = system('sed "s/\\\//g" ', a:str)
  return out
endfunction
call MapAction('Unescape', '<leader>us')

fun! s:SqlBeautifier(str)
  let out = system('run_function sql_format', a:str)
  return out
endfunction
call MapAction('SqlBeautifier', '<leader>sb')

call MapAction('XmlBeautifier', '<leader>x')
fun! s:XmlBeautifier(str)
  let out = system('run_function xml_beautifier ', a:str)
  return out
endfunction
call MapAction('XmlBeautifier', '<leader>xb')

"}}}
"syntatic checker{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:syntastic_php_checkers = ['phpcs', 'phpmd']
let g:syntastic_sh_checkers = ['shellcheck']
"}}}
"Markdown configs {{{
let g:vim_markdown_no_extensions_in_markdown = 1
"autocmd BufNewFile * if &filetype == "" | call MarkdownDefaultConfigs() | endif
"autocmd BufNewFile * if &filetype == "txt" | call MarkdownDefaultConfigs() | endif
autocmd Filetype markdown call MarkdownDefaultConfigs()
highlight Folded ctermfg=DarkYellow

fun! MarkdownDefaultConfigs()
    "set filetype=markdown
    set syntax=markdown
    set spell spelllang=en_us
endfunction

autocmd FileType markdown setl tw=66
let g:vim_markdown_math = 1
"syntax highlight for markdown
let g:vim_markdown_fenced_languages = ['html', 'py=python', 'bash=sh', 'c', 'php', 'hs=haskell', 'elm']
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
endfunction

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
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr

fun! s:Italic(str)
    return '*'.a:str.'*'
endfunction
call MapAction('Italic', '<leader>i')

fun! s:Bold(str)
    return '**'.a:str.'**'
endfunction
call MapAction('Bold', '<leader>bo')

fun! s:CodeBlock(str)
    return "```sh\n".a:str."\n```"
endfunction
call MapAction('CodeBlock', '<leader>c')


"}}}
"diary{{{
nnoremap <Leader>di :Today<cr>
nnoremap <Leader>to :Today<cr>
fun! Diary( arg )
    let out = system('run_function diary_file "' . a:arg . '"')
    execute "edit " . out
endfunction
command! -nargs=* Tomorrow call Diary( 'tomorrow' )
command! -nargs=* Yesterday call Diary( 'yesterday' )
command! -nargs=* Today call Diary( 'today' )
command! -nargs=* Someday call Diary( 'someday' )
command! -nargs=* Diary call Diary( '<args>' )
command! -nargs=* NextRetrospective call Diary( 'next monday' )

fun! GrepDiary( arg )
    let old_path = $pwd
    exec "cd " . $DIARY_PATH
    execute "grep " . a:arg . "  "
    exec "cd ". old_path
endfunction
command! -nargs=* GrepDiary call GrepDiary( '<args>' )
command! -nargs=* DiaryGrep call GrepDiary( '<args>' )


fun! BottomDiary( arg )
    let out = system("run_function diary_file " . a:arg )
    execute "split" . out
    res 10
endfunction
command! -nargs=* BottomDiary call BottomDiary( '<args>' )
"}}}
"task manager {{{
fun! s:MarkDone(str)
  let out = system('sed -r "s/(○ |◎ )//g; s/(.*)/● \1/g" ', a:str)
  return out
endfunction
call MapAction('MarkDone', '<leader>md')

fun! s:MakeTask(str)
  let out = system('sed -r "s/(◐ |◎ )//g; s/(.*)/○ \1/g" ', a:str)
  return out
endfunction
call MapAction('MakeTask', '<leader>mt')

fun! s:MakeApointment(str)
  let out = system('sed -r "s/(.*)/◐ \1/g" ', a:str)
  return out
endfunction
call MapAction('MakeApointment', '<leader>ma')

fun! s:MakeSomeday(str)
  let out = system('sed -r "s/(◐ |○ )//g; s/(.*)/◎ \1/g" ', a:str)
  return out
endfunction
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
endfunction
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
endfunction
fun! GetLine()
    normal! yy
    return @"
endfunction

fun! OpenMarkdown()
    let url = GetUrl()
    let path = expand('%:p:h')
    execute 'edit ' . path . '/' . url . '.md'
endfunction

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
nnoremap <CR> :call OpenFile()<cr>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

fun! OpenUrl(url)
    silent execute '! $BROWSER "' . a:url . '" 1>/dev/null  &'
endfunction
nnoremap gx :call OpenUrl()<cr>

fun! GrepWiki( arg )
    let old_path = $pwd
    exec "cd " . $WIKI_PATH
    execute "grep " . a:arg . "  "
    exec "cd ". old_path
endfunction
command! -nargs=* GrepWiki call GrepWiki( '<args>' )
command! -nargs=* WikiGrep call GrepWiki( '<args>' )
"}}}
"files templates matching {{{
autocmd BufNewFile *Test.php 0r $TEMPLATES_DIR/php_test.php
autocmd BufNewFile *Gateway.php 0r $TEMPLATES_DIR/php_gateway.php
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
endfunction
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


" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

fun! OpenTest()
  let original_file = expand('%')
  let out = system('echo "'.original_file.'" | run_function test_from_file')
  execute 'edit '.out
endfunction
map <Leader>ot :call OpenTest()<cr>

nmap <leader>crn :call CopyCurrentRelativePath()<cr>
fun! CopyCurrentRelativePath()
  let path = RelativePath(expand("%:p"))
let result = system('mycopy ', path)
endfunction
fun! RelativePath(filename)
    let cwd = getcwd()
    let s = substitute(a:filename, l:cwd . "/" , "", "")
    return s
endfunction

fun! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>

fun! CopyFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    redraw!
  endif
endfunction
map <Leader>cp :call CopyFile()<cr>
"}}}
"git {{{
fun! GitLog()
    execute '!run_function terminal_run "cd $(dirname %:p) ; git log -p --follow %:p" &'
endfunction
nmap <leader>gk :call GitLog()<cr>

fun! FzfContent()
    execute ':!cd  '.$PWD.' ;  fzf_content > /tmp/fzf_current '
    redraw!
    let out = system('cat /tmp/fzf_current')
    execute 'edit '.out
endfunction
map <c-s> :call FzfContent()<cr>

map <leader>ck :!git checkout %<cr>
fun! Blame(arg)
    let current_line = line(".") + 1
    let file_name = expand('%')
    let out = system('git blame '.file_name.' > /tmp/blame')
    execute "vsplit +".current_line." /tmp/blame"
endfunction
command! -nargs=* Blame call Blame( '<args>' )


fun! CheckoutFile(arg)
    let file_name = expand('%')
    execute '!git checkout ' . file_name
    execute 'edit!'
endfunction
command! -nargs=* CheckoutFile call CheckoutFile( '<args>' )



fun! OpenRepoOnGithub(arg)
    let repo = system('git remote -v | cut -d ":" -f2 | cut -d "." -f1 | head -n 1')
    let url = "https://github.com/" . repo . ".git"
    let result = system("$BROWSER " . url . " & ")
endfunction
command! -nargs=* GithubRepo call OpenRepoOnGithub( '<args>' )
"}}}
"php{{{
fun! s:JsonToPhp(str)
  let out = system('json-to-php ', a:str)
  return out
endfunction
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

    split __PHPUnit_Result__
    normal! ggdG
    setlocal buftype=nofile
    call append(0, myCommand)
    call append(0, split(result, '\v\n'))
    cd -
endfun
nnoremap <leader>u :call RunPHPUnitTest(0)<cr>
nnoremap <leader>f :call RunPHPUnitTest(1)<cr>
autocmd filetype php nnoremap <leader>s :Phpcsfixer<cr>
"}}}
" tagbar {{{
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/home/jean/projects/dotfiles/vimrc/vim/plugged/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
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
endfunction
nnoremap <leader>rm :RepeatAndMove(<cr>
command! -nargs=* RepeatAndMove call RepeatAndMove()
" }}}
"
