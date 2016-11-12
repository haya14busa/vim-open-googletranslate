let s:URI = vital#opengoogletranslate#import('Web.URI')

" opengoogletranslate#url() returns URL of Google Translate with given input.
" target_lang and from_lang args can be empty string.
function! opengoogletranslate#url(input, target_lang, from_lang) abort
  let to = a:target_lang ==# '' ? s:infer_target_lang() : a:target_lang
  return s:gtl_url(a:input, to, a:from_lang)
endfunction

" s:gtl_url() returns URL of Google Translate with given input. from_lang arg
" can be empty and converted to 'auto'.
"
" https://translate.google.com/#auto/{lang}/{input}
" https://translate.google.com/#en/ja/input
" e.g. https://translate.google.com/#auto/ja/input
function! s:gtl_url(input, target_lang, from_lang) abort
  let from = a:from_lang ==# '' ? 'auto' : a:from_lang
  let i = s:URI.encode(a:input)
  return printf('https://translate.google.com/#%s/%s/%s', from, a:target_lang, i)
endfunction

function! s:infer_target_lang() abort
  return s:_infer_target_lang(v:lang)
endfunction

function! s:_infer_target_lang(lang) abort
  if a:lang ==# 'C'
    return 'en'
  elseif len(a:lang) < 2
    return 'en'
  else
    return a:lang[:1]
  endif
endfunction

