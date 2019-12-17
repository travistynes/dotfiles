set termguicolors

" Add fuzzy finder (fzf) to vim's runtimepath
set rtp+=~/.fzf

" Install vim-plug if needed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug section - use :PlugInstall to install these plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tommcdo/vim-fubitive.git'
Plug 'universal-ctags/ctags'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-scripts/taglist.vim.git'
Plug 'https://github.com/travistynes/groovyindent-unix'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'

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
set updatetime=500 " Used by CursorHold to highlight word under cursor after time value

" Set leader
:nnoremap <SPACE> <Nop>
let mapleader = " "

" Open nerd tree
:nnoremap <leader>t :NERDTreeToggle<CR>

" Open nerd tree and reveal the current file in the tree
:nnoremap ,t :NERDTreeFind<CR>

" Start fuzzy finder
:nnoremap ,f :Files<CR>

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
":nnoremap <leader>f :grep! -rnwI --exclude={tags,*.vim} --exclude-dir={target,build,output,node_modules,logs} -e "<C-R><C-W>" . <CR> :bo cw<CR>

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
:command! FormatJson %!python -m json.tool

" Goto keys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)

nmap <leader>f <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)
nmap <silent> rn <Plug>(coc-rename)

" Highlight word under cursor after updatetime
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show documentation for word under cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Set color theme
let g:PaperColor_Theme_options = {
\	"theme": {
\		"default": {
\			"transparent_background": 0
\		}
\	}
\}

set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'
