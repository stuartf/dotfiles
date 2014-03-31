syntax on
set nocompatible
set incsearch
set hlsearch
set ignorecase
set tabstop=2
set expandtab
set shiftwidth=2
set visualbell
set background=dark
"" filetype off for vundle
filetype off
"filetype plugin on
"filetype plugin indent on
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"let g:vundle_default_git_proto = 'git'
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'majutsushi/tagbar'

filetype plugin indent on "required for vundle

NeoBundleCheck

"airline doesn't show up until laststatus is 2 for some reason
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_right_sep = '▜'
let g:airline_left_sep = '▙'
