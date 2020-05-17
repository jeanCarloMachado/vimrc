
fun! FoldSomething(str)
    let comment=split(&commentstring, '%s')
    if len(l:comment)==1
        call add(comment, l:comment[0])
    endif
    return l:comment[0]." {{{\n".a:str."\n".l:comment[1]."}}}"
endfun

call toop#mapFunction('FoldSomething', '<leader>fo')

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
"sum numbers of a text
call toop#mapShell('run_function printInputAndOutput numbers_of_text.py "+"', '<leader>sn')

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

" call toop#mapShell('tr " " "\n"', '<leader>sn')
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
call toop#mapAround("\"\"\"\n", "\n\"\"\"", '<leader>3"')
-call toop#mapAround('"', '"', '<leader>"')
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
"
"
"
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
"
"
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
