set nocompatible              " be iMproved, required
filetype off                  " required

" Add fuzzy finder (fzf) to vim's runtimepath
set rtp+=~/.fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'https://github.com/tommcdo/vim-fubitive.git'
Plugin 'universal-ctags/ctags'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/vim-scripts/taglist.vim.git'
Plugin 'https://github.com/travistynes/groovyindent-unix'
Plugin 'https://github.com/junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vim-plug section - use :PlugInstall to install these plugins
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax on
set t_Co=256
set hidden
set number
set ignorecase
set tw=0 " Disable inserting a newline on word wrap.
set hlsearch
set wildmenu
set wildmode=list

" Set leader
:nnoremap <SPACE> <Nop>
let mapleader = " "

" Open nerd tree
:nnoremap <leader>t :NERDTreeToggle<CR>

" Open nerd tree and reveal the current file in the tree
:nnoremap ,t :NERDTreeFind<CR>

" Toggle tag list
:nnoremap <leader>m :TlistToggle<CR>

" Switch buffers with buf# <leader>n
:nnoremap <leader>n <C-^> 

" Close current buffer
:nnoremap <leader>c :bd<CR> 
:nnoremap <leader>C :bd!<CR> 

" Shortcut window functions
:nnoremap <leader>w <C-w>

" Grep for word under cursor, don't go to first match (grep!) and open the
" quickfix list at the bottom.
:nnoremap <leader>f :grep! -rnwI --exclude={tags,*.vim} --exclude-dir={target,build,output,node_modules,logs} -e "<C-R><C-W>" . <CR> :bo cw<CR>

:nnoremap <leader>g :w<CR>:!gradle run<CR>

" Go to definition of word under cursor.
:nnoremap <leader>] <C-]>

" Pop tag stack
:nnoremap <leader>[ <C-t>

" Auto format current file using Eclipse
" See https://help.eclipse.org/luna/index.jsp?topic=%2Forg.eclipse.jdt.doc.user%2Ftasks%2Ftasks-231.htm
:nnoremap <leader>ff :!eclipse -application org.eclipse.jdt.core.JavaCodeFormatter -config ~/Documents/projects/.java-format.xml %:p<CR>

" Disable whitespace extension in airline statusline
let g:airline#extensions#whitespace#enabled = 0

" Only show tags in taglist for the current buffer
let Tlist_Show_One_File = 1

" Add command to pretty format JSON (user defined commands must start with a
" capital letter, and underscores are not allowed.
:command FormatJson %!python -m json.tool
