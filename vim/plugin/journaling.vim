
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


function! s:goyo_enter()
  let w:airline_disabled = 1
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
