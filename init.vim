lua require'plugins'
lua require'init'
lua require'keybindings'
lua require'vim_config'
lua require'completion'
lua require'autopairs'
lua require'treesitter'
lua require'global_variables'
" Ultisnip
let ayucolor="mirage"
set foldexpr=nvim_treesitter#foldexpr()
augroup highlight
    autocmd!
    autocmd CursorHold,CursorHoldI * :lua vim.lsp.buf.hover()
augroup END
"
autocmd StdinReadPre * let s:std_in=1
let g:clipboard = {
            \ 'name': 'win32yank',
            \ 'copy': {
                \    '+': 'win32yank.exe -i --crlf',
                \    '*': 'win32yank.exe -i --crlf',
                \  },
            \ 'paste': {
                \    '+': 'win32yank.exe -o --lf',
                \    '*': 'win32yank.exe -o --lf',
                \  },
            \ 'cache_enabled': 0,
        \ }
" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable = 1
" map ctrl+k+i to Hover
" map 	
" let g:lightline = {
"             \ 'colorscheme': 'wombat',
"             \ 'active' : {
"                 \ 'left': [ [ 'mode', 'paste' ],
"                 \           [ 'readonly', 'filename', 'modified' ] ],
"                 \ 'right': [ [ 'lineinfo' ],
"                 \            [ 'percent' ],
"                 \            [ 'fileformat', 'fileencoding', 'filetype' ] ]}}
" \ 'component_function': {
" \   'filetype': 'MyFiletype',
" \   'fileformat': 'MyFileformat',
" \ }
" \ }

" function! MyFiletype()
"     return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction

" function! MyFileformat()
"     return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=50}
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ wincmd p | enew | execute 'cd '.argv()[0] | execute 'NvimTreeToggle' |  endif
