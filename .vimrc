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

" Indentation level highlight
" Works only with spaces
Plug 'https://github.com/Yggdroot/indentLine'

call plug#end()

"""""""""""""""""""""""""""""""""""

" Enable filetype base syntax highlighting
filetype plugin indent on
syntax enable

" Indentation level highlight for tabs
" Note that │ is different from |
set list lcs=tab:\│\  

" Enable C/C++ Formatting on save
let g:clang_format#auto_format = 1

" Terminal-specific quirk
" Make termguicolors work in st
" https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" To display the fancy symbols I used a pre-patched font 
" from here:
" https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
" This is used is set for use in st

" Enable fancy symbols
let g:airline_powerline_fonts=1

" Set Theme
set termguicolors
let g:equinusocio_material_style = 'pure' "default, dark, darker, pure
let g:airline_theme='equinusocio_material'
colorscheme equinusocio_material 

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
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Building
set makeprg=make\ -j9

" Keybindings
nmap <F4> :make<cr> 
nmap <F2> :TagbarToggle<cr>
nmap <F1> :NERDTreeToggle<cr>

" set zathura as pdf viewer
let g:vimtex_view_method='zathura'

" Highlight row and column (for indentation)
:set cursorline cursorcolumn

" Enable mouse drag on window split
set mouse=a

