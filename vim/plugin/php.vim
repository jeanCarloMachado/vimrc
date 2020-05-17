
call toop#mapShell('json_encode_from_php', '<leader>pj')
call toop#mapShell('json-to-php', '<leader>jp')
"php_cs_fixer_options
"
""force all tpl to be treated like html
" autocmd BufNewFile,BufRead *.tpl set syntax=html
let g:dispatch_compilers = {}
" let g:dispatch_compilers['./vendor/bin/']
let g:dispatch_compilers['phpunit'] = './vendor/bin/phpunit'

autocmd BufNewFile *[^Test].php 0r $TEMPLATES_DIR/php.php
autocmd BufNewFile */phpunit.xml 0r $TEMPLATES_DIR/phpunit.xml
autocmd BufNewFile */*Test.php 0r $TEMPLATES_DIR/phpTest.php
