
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
"}}}
