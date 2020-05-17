
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

""" tried already to to pdf of buffer but is very hard to do so. I do not
fun! PDFFile(str)
    let path = expand('%:p')
    execute 'AsyncRun run_function pdfFromFile "'.path.'"'
endfun
command! -nargs=* PDFFile call PDFFile( '<args>' )
nnoremap <Leader>pdf :PDFFile<cr>



command! -nargs=* ForceSave call SaveForcing()
command! -nargs=* SaveForce call SaveForcing()
command! -nargs=* RemoveFile call RemoveFile()

command! -nargs=* OpenDirectory :!open %:p:h &<cr>
noremap <silent> <leader>rmrf :RemoveFile<cr>
map <Leader>mv :call MoveFile()<cr>
map <Leader>cp :call CopyFile()<cr>
