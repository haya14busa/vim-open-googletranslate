let s:URI = vital#opengoogletranslate#import('Web.URI')

let g:opengoogletranslate#default_lang = get(g:, 'opengoogletranslate#default_lang', '')
let g:opengoogletranslate#openbrowsercmd = get(g:, 'opengoogletranslate#openbrowsercmd', '')

" opengoogletranslate#open() opens Google Translate page.
"
" TODO: support removing comment prefix in given input?
function! opengoogletranslate#open(...) abort
  let url = call('opengoogletranslate#url', a:000)
  let [cmd; args] = split(g:opengoogletranslate#openbrowsercmd, ' ')
  if executable(cmd) ==# 1
    call job_start([cmd] + args + [url])
    return
  endif
  try
    call openbrowser#open(url)
  catch /^Vim\%((\a\+)\)\=:E117/
    call s:throw('open-broser.vim not found. Please install https://github.com/tyru/open-browser.vim')
  endtry
endfunction

" opengoogletranslate#url() returns URL of Google Translate.
" target_lang and from_lang args can be empty string.
function! opengoogletranslate#url(input, target_lang, from_lang) abort
  let to = a:target_lang
  if to ==# ''
    if g:opengoogletranslate#default_lang !=# ''
      let to = g:opengoogletranslate#default_lang
    else
      let to = s:infer_target_lang()
    endif
  endif
  return s:gtl_url(a:input, to, a:from_lang)
endfunction

" s:gtl_url() returns URL of Google Translate. from_lang arg can be empty and
" will be converted to 'auto'.
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

function! s:throw(msg) abort
  throw printf('vim-open-googletranslate: %s', a:msg)
endfunction
