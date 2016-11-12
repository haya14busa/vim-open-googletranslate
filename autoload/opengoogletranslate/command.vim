"=============================================================================
" FILE: autoload/command/opengoogletranslate.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:ArgumentParser = vital#opengoogletranslate#import('ArgumentParser')

function! s:get_parser() abort
  let s:parser = s:ArgumentParser.new({
  \   'name': 'OpenGoogleTranslate',
  \   'description': 'open Google Translate in browser',
  \ })
  call s:parser.add_argument(
  \   '--to', '-t', 'language translate to (e.g. en, ja, etc...)', {
  \     'type': s:ArgumentParser.types.value,
  \   }
  \ )
  call s:parser.add_argument(
  \   '--from', '-f', 'language translate from (e.g. en, ja, etc...)', {
  \     'type': s:ArgumentParser.types.value,
  \   }
  \ )
  return s:parser
endfunction

function! s:parse(...) abort
  let parser = s:get_parser()
  return call(parser.parse, a:000, parser)
endfunction

function! opengoogletranslate#command#command(...) abort
  let options = call('s:parse', a:000)
  if empty(options)
    return
  endif
  let to = get(options, 'to', '')
  let from = get(options, 'from', '')
  let input = join(options.__unknown__, ' ')
  if input ==# ''
    let [start, end] = [options.__range__[0], options.__range__[1]]
    let input = join(getline(start, end), "\n")
  endif
  call opengoogletranslate#open(input, to, from)
endfunction

function! opengoogletranslate#command#complete(...) abort
  let parser = s:get_parser()
  return call(parser.complete, a:000, parser)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
