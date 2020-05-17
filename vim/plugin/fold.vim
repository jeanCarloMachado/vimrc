set foldmethod=expr
\ foldexpr=lsp#ui#vim#folding#foldexpr()
\ foldtext=lsp#ui#vim#folding#foldtext()

" fold {{{
"enter fold giving a list of options on conflicts
" nnoremap <C-]> g<C-]>
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

"}}}

