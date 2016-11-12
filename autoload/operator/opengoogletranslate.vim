"=============================================================================
" FILE: autoload/operator/opengoogletranslate.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:SelectedText = vital#opengoogletranslate#import('Vim.SelectedText')

" operator#opengoogletranslate#do() open Google Translate with selected text.
"
" @param {'char'|'line'|'block'} wise
function! operator#opengoogletranslate#do(wise) abort
  let input = s:SelectedText.text(a:wise, getpos("'["), getpos("']"))
  call opengoogletranslate#open(input, '', '')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
