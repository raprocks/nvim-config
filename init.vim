call plug#begin("~/.vim/plugged")
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'kabouzeid/nvim-lspinstall'
" Plug 'nvim-lua/completion-nvim'
" Plug 'SirVer/ultisnips'
" Plug 'chriskempson/base16-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'sbdchd/neoformat'
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'
call plug#end()
" colorscheme gruvbox8
" let g:gruvbox_filetype_hi_groups = 1
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Ultisnip
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

lua require'init'
lua require'keybindings'
lua require'vim_config'
lua require'completion'
lua require'autopairs'
lua require'treesitter'
lua require'global_variables'
