
function! FloatingFZF()
    let width = float2nr(&columns * 0.85)
    let height = float2nr(&lines * 0.70)
    let opts = { 'relative': 'editor',
                \ 'row': (&lines - height) / 2,
                \ 'col': (&columns - width) / 2,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'}

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:height = float2nr(&lines * 0.9)
let g:width = float2nr(&columns * 0.95)
let g:preview_width = float2nr(&columns * 0.4)
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND =  'rg --files  --hidden --follow --glob "!.git/*" '
let $FZF_DEFAULT_OPTS=" --color 'fg:#839496,fg+:#93a1a1,bg:#002b36,bg+:#073642'  --layout=reverse  --margin=3,6 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --line-range :40 {}; fi' --preview-window right:" . g:preview_width
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
   





"fzf {{{
let g:fzf_buffers_jump = 1
" map <c-p> :FZF<cr>
nnoremap <silent> <c-n> :call fzf#run(fzf#wrap({
\    'source': 'find .'
\ }))<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>bl :call fzf#run(fzf#wrap({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ }))<CR>


" MRU {{{
nnoremap <leader>mru :Mru<cr>
"}}}

let g:fzf_buffers_jump = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"}}}
