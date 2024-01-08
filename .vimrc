"
"
" _|      _|  _|_|_|  _|      _|  _|_|_|      _|_|_|
" _|      _|    _|    _|_|  _|_|  _|    _|  _|
" _|      _|    _|    _|  _|  _|  _|_|_|    _|
"   _|  _|      _|    _|      _|  _|    _|  _|
"     _|      _|_|_|  _|      _|  _|    _|    _|_|_|
"
"
"
" Plug-in Manager is vimplug, use :PlugInstall to install packages
"
call plug#begin('~/.vim/vimplugins')
""""""""""""""""""""""""""""""""""""
"PLUGINS
""""""""""""""""""""""""""""""""""""
" Statusbar
Plug 'vim-airline/vim-airline'

" Theme
Plug 'yunlingz/equinusocio-material.vim'

" Auto-complete
Plug 'Valloric/YouCompleteMe'

" C/C++ Formatting
Plug 'https://github.com/rhysd/vim-clang-format'

" Git integration
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-fugitive'

" Latex
Plug 'lervag/vimtex'

" File tree
Plug 'https://github.com/preservim/nerdtree'

" Automatic brackets and quotes
Plug 'itmammoth/doorboy.vim'

" lists functions, classes, methods
Plug 'https://github.com/preservim/tagbar'

" Debugger
Plug 'https://github.com/cpiger/NeoDebug'

" Log highlight
Plug 'mtdl9/vim-log-highlighting'

" ctags management
Plug 'https://github.com/ludovicchabant/vim-gutentags'

" wayland clipboard
Plug 'https://github.com/jasonccox/vim-wayland-clipboard.git'

" file finder
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Github copilot
"Plug 'https://github.com/github/copilot.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""
" Set Theme
" Be aware that this should be on top,
" because otherwise it will overwrite
" other things like spell highlighting
set termguicolors
let g:equinusocio_material_style = 'pure' "default, dark, darker, pure
let g:airline_theme='equinusocio_material'
colorscheme equinusocio_material

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight Normal guibg=NONE

" Enable filetype base syntax highlighting
filetype plugin indent on
syntax enable

" Spelling for .tex files
augroup texSpell
	autocmd!
	autocmd FileType tex setlocal spell
	autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
	:hi SpellBad cterm=bold ctermfg=red
augroup END

" Enable fancy symbols
let g:airline_powerline_fonts=1

" Some airline optimizations
let g:airline_extensions = []
let g:airline_highlighting_cache = 1

" Disable mouse wheel
set mouse=""

" Show tabs
set list lcs=tab:-->

" Show spaces as dots
set list lcs+=space:·

" Highlight extra white space
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Enable C/C++ Formatting on save
  let g:clang_format#auto_format = 0

" Only format diff lines
  let g:clang_format#auto_format_git_diff = 1
" I found this to not work reliably

" Always use tabs for indentation
" See here: https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
			\ 'UseTab' : 'Always',
			\ 'BasedOnStyle' : 'Google',
			\ 'TabWidth' : 8,
			\ }

" Disable ycm asking every time for conf file
let g:ycm_confirm_extra_conf = 0
" Potentially dangerous: read documentation!

" Automatically open Tagbar
" This does not work reliably
" autocmd BufEnter,BufNewFile *.{cpp,c,h,hpp,v,tex,py} :Tagbar

"Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled=1

" Statusbar
set laststatus=2

" Line numbers
set number

" Tab sizes
set tabstop=8
set softtabstop=8
set shiftwidth=8

" Use spaces instead of tabs
" set expandtab
" makes this vvvvvvvvvv unnecessary
" Use spaces instead of tabs for assembly
au BufEnter *.s set expandtab
au BufEnter *.asm set expandtab

" Building
set makeprg=make\ -j8

" Keybindings
nmap <F4> :make<cr>
nmap <F2> :TagbarToggle<cr>
nmap <F1> :NERDTreeToggle<cr>
nmap gn :bnext<cr>
nmap gp :bprevious<cr>
nmap gd :bdelete<cr>
nmap <C-p> :CtrlP<cr>

" set zathura as pdf viewer
let g:vimtex_view_method='zathura'

" Highlight row and column (for indentation)
:set cursorline cursorcolumn

" Enable mouse drag on window split
set mouse=a

" Highlight 80th column
set colorcolumn=80
