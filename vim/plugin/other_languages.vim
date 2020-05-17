

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


