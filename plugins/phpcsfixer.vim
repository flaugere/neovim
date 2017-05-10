let g:php_cs_fixer_command = 'php-cs-fixer fix'

fun! PhpCsFixerFix(path)
    let command = g:php_cs_fixer_command.' '.a:path
    exe ':! echo '.command.' && '.command
endfun

fun! PhpCsFixerFixDirectory()
    call PhpCsFixerFix(expand('%:p:h'))
endfun

fun! PhpCsFixerFixFile()
    call PhpCsFixerFix(expand('%:p'))
endfun

map <leader>pcd :call PhpCsFixerFixDirectory()<CR>
map <leader>pcf :call PhpCsFixerFixFile()<CR>
