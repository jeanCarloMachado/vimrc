
set termguicolors
set background=light

let g:gitgutter_override_sign_column_highlight = 0
" set termguicolors
" let g:solarized_termcolors=256
" let g:theme = 'dark'
" let g:theme = 'light'
"theme, colors, highlights {{{
"the later syntax is applied the better
"since something might override it
syntax enable



"base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
"base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
"base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
"base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
"base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
"base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
"base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
"base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
"yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
"orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
"red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
"magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
"violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
"blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
"cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
"green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60


colorscheme NeoSolarized

"reapplies the sytanx when it's broken
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
"}}}
" settings for light color solarized
fun! PersonalHighlights()
	" """ this changes where mainly made to make the solarized light them
	" """ better for use for getting a better sense of the options do a
	" """ :h ColorColumn

    " if g:theme == "light"
        " highlight Cursor ctermbg=NONE cterm=bold
        " highlight CursorColumn ctermbg=Yellow cterm=bold
        " highlight CursorLine ctermbg=white
        " highlight ALEErrorSign ctermbg=NONE ctermfg=red
        " highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        " set hlsearch
        " hi Folded ctermbg=white
        " highlight LineNr ctermbg=white
        " hi VertSplit ctermbg=white
        " hi illuminatedWord cterm=underline gui=underline
        " hi StatusLine ctermfg=white
        " hi StatusLineNC ctermfg=white
        " highlight clear SignColumn
        highlight SignColumn guibg=#fdf6e3
        highlight FoldColumn guibg=#fdf6e3
        " highlight ColorColumn ctermbg=white

        " " popup menu color
        " " highlight Pmenu ctermfg=white
        " highlight PmenuSel ctermfg=white
        " highlight PmenuSbar ctermfg=white
        " highlight QuickFixLine ctermfg=white
        " highlight TabLine ctermbg=white
        " highlight TabLineFill ctermbg=white
        " highlight TabLineSel ctermbg=white
    " else
        " highlight SignColumn ctermbg=black
        " highlight FoldColumn ctermbg=black
        " highlight ColorColumn ctermbg=black

    " endif

endfun


" let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts = 1


" if g:theme == 'dark'
" 	set background=dark
" else
" 	set background=light
" endif

call PersonalHighlights()

" concealing {{{
autocmd FileType php call matchadd('Conceal', '"', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', "'", 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'class ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', ';', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', '\$', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'function ', 999, -1, {'conceal': ''}) |
    \ call matchadd('Conceal', 'public ', 999, -1, {'conceal': ''})

" set concealevel=2 "show pretty latex formulas
let g:conceal_php_disable_ligature=1
"}}}
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction



let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0