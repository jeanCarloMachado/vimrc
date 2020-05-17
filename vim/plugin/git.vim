
"git {{{
fun! GitLog()
    let path = expand('%:p')
    let cmd='export REALP=$(realpath '.path.') ; cd $(dirname $REALP) ; git log -p --follow $(realpath $REALP)'
    :execute 'vnew | 0read ! '.cmd
    :set syntax=git
    :normal gg
endfunc
nmap <leader>gk :call GitLog()<cr>
nmap <leader>gl :call GitLog()<cr>

fun! GitDiff()
    let path = expand('%:p')
    let cmd='export REALP=$(realpath '.path.') ; cd $(dirname $REALP) ; git diff $(realpath $REALP)'
    :execute 'vnew | 0read ! '.cmd
    :set syntax=git
    :normal gg
endfunc
nmap <leader>gdf :call GitDiff()<cr>

map <leader>gck :!git checkout %<cr>

map <leader>gckp :!git checkout HEAD~1 %<cr>
command! -nargs=* Blame :Gblame<cr>
map <leader>gb :Gblame<cr>

fun! CheckoutFile(arg)
    let file_name = expand('%')
    execute '!git checkout ' . file_name
    execute 'edit!'
endfunc
command! -nargs=* CheckoutFile call CheckoutFile( '<args>' )

fun! OpenRepoOnGithub(arg)
    let repo = system('git remote -v | cut -d ":" -f2 | cut -d "." -f1 | head -n 1')
    let url = "https://github.com/" . repo . ".git"
    let result = system("open " . url . " & ")
endfunc
command! -nargs=* GithubRepo call OpenRepoOnGithub( '<args>' )
"}}}
nnoremap <Leader>ga :Gwrite<cr>
nnoremap <Leader>gc :Gcommit<cr>
