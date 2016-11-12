"=============================================================================
" FILE: autoload/operator/opengoogletranslate.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:SelectedText = vital#opengoogletranslate#import('Vim.SelectedText')

let s:INT = { 'MAX': 2147483647 }

" operator#opengoogletranslate#do() open Google Translate with selected text.
"
" @param {'char'|'line'|'block'} wise
function! operator#opengoogletranslate#do(wise) abort
  let [begin, end] = [getpos("'["), getpos("']")]
  if a:wise ==# 'block'
    normal! gv
    let curswant = winsaveview().curswant
    if curswant ==# s:INT.MAX
      if begin[2] > end[2]
        let begin[2] = s:INT.MAX
      else
        let end[2] = s:INT.MAX
      endif
    endif
    execute 'normal!' "\<Esc>"
  endif
  let input = s:SelectedText.text(a:wise, begin, end)
  call opengoogletranslate#open(input, '', '')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
