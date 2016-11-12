## vim-open-googletranslate

vim-open-googletranslate provides utilities which helps you open Google Translate (https://translate.google.com/) from Vim.

See [![:h open-googletranslate.txt](https://img.shields.io/badge/doc-%3Ah%20open--googletranslate.txt-red.svg)](doc/open-googletranslate.txt)

![vim-open-googletranslate demo](https://raw.githubusercontent.com/haya14busa/i/cd1e9f0386daf5d2a04e81f76ac86bb9f4d0af15/vim-open-googletranslate/anim.gif)


If you find yourself opening too many tabs using vim-open-googletranslate, you
might want to use electron-open-url](https://github.com/rhysd/electron-open-url)
to reuse the same opened window.

```vim
let g:opengoogletranslate#openbrowsercmd = 'electron-open --without-focus'
```

![with electron-open-url](https://raw.githubusercontent.com/haya14busa/i/7fbb23a9570f8d0699e05d27e3375552d6505e6d/vim-open-googletranslate/with-electron-open-url.gif)

If you were looking for more streamlined Google Translation integration with Vim,
see https://github.com/haya14busa/vim-gtrans which uses Google Translation API internally.
