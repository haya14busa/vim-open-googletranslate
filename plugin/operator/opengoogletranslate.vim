"=============================================================================
" FILE: plugin/operator/opengoogletranslate.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_operator_opengoogletranslate
endif
if exists('g:loaded_operator_opengoogletranslate')
  finish
endif
let g:loaded_operator_opengoogletranslate = 1
let s:save_cpo = &cpo
set cpo&vim

try
  call operator#user#define('open-googletranslate', 'operator#opengoogletranslate#do')
catch /^Vim\%((\a\+)\)\=:E117/
  " vim-operator-user not found.
endtry

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
