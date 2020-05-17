" configurations specific of syntax highlight and comments

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
