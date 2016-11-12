"=============================================================================
" FILE: plugin/opengoogletranslate.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_opengoogletranslate
endif
if exists('g:loaded_opengoogletranslate')
  finish
endif
let g:loaded_opengoogletranslate = 1
let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* -range=% -bang
\   -complete=customlist,opengoogletranslate#command#complete
\   OpenGoogleTranslate
\   call opengoogletranslate#command#command(<q-bang>, [<line1>, <line2>], <q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
