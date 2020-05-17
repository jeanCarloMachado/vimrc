let g:VimuxHeight = "20"
fun! TmuxContent()
    let idx = g:VimuxRunnerIndex
    let out = system('tmux capture-pane -J -p -t '.idx.' > /tmp/tmux')
    :vsplit /tmp/tmux
endfunc
nnoremap <leader>ec :call TmuxContent()<cr>
nnoremap <leader>eh :call TmuxContent()<cr>

let g:repls = {
\   'ruby': 'irb',
\   'python': 'python',
\   'haskell': 'ghc',
\   'php': 'boris',
\   'scala': 'sbt',
\   'default': 'irb',
\}

fun! Repl()
    if (has_key(g:repls, &filetype))
      let cmd = get(g:repls, &filetype)
      :VimuxRunCommand(cmd."\n")
      return
    endif

    let cmd = get(g:repls, 'default')
    :VimuxRunCommand(cmd."\n")
endfunc
nmap <leader>rr  :call Repl()<cr>
nmap <leader>od :VimuxRunCommand("cd ".expand('%:p:h'))<cr>
nmap <leader>ls :VimuxRunCommand("cd ".expand('%:p:h'))<cr>
