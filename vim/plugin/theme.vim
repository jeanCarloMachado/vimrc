let theme='dark'

if $MY_THEME != ""
  let theme=$MY_THEME
endif

execute('let g:theme = "'  . theme . '"' )
execute('set background=' . theme)

let g:solarized_termtrans = 1
syntax enable
colorscheme solarized

