
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
"
