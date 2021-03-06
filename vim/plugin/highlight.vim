" file for ide capabilities in vim

"linting, fixing - ale config {{{
nnoremap <leader>fmt :ALEFix<cr>
let g:ale_set_highlights = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_writegood_options = ' --so --illusion --adverb --tooWordy --cliches'
let g:ale_sign_warning = '⚠'
let b:ale_warn_about_trailing_whitespace = 0

let g:ale_sign_error = '✖'
let g:ale_sign_info = '-'
let g:ale_sign_style_error = '✖'
let g:ale_sign_style_warning = '-'
let g:ale_sign_warning = '-'

let g:lsp_highlight_references_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'} " icons require GUI
let g:lsp_highlights_enabled = 0
let g:lsp_diagnostics_enabled = 0


let g:ale_php_cs_fixer_executable = '/home/jean/Dropbox/projects/dotfiles/scripts/php-cs-fixer-fishfarm.sh'

let g:ale_linters = {
\   'python': ['mypy', 'flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'sh': ['shell', 'shellcheck'],
\   'markdown': ['write-good', 'proselint'],
\   'scala': ['fsc', 'scalac'],
\   'swift': ['swiftlint'],
\   'php': ['php', 'phpcs'],
\   'elm': ['elm-fomart', 'elm-make']
\}

" the python fixer that sets the correct indentation for files is  yapf
" and we have a copy of it in personal scripts: /home/jean/Dropbox/projects/dotfiles/scripts/yapf
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'yapf'],
\   'php': ['php_cs_fixer'],
\   'scala': ['scalafmt'],
\   'swift': ['swiftformat'],
\   'elm': ['elm-format']
\}
"}}}

let g:ale_completion_enabled = 1
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
