set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'

" Plugins
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" Colorschemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Basic Configurations
set number hls incsearch
set ruler cursorline
set showcmd
set autoindent smarttab
set sts=4 ts=4 sw=4 expandtab
set wrap nolinebreak
set textwidth=80
set wrapmargin=2
set foldmethod=syntax

set t_Co=256
set background=dark
colorscheme gruvbox

let g:mapleader='q'

" Configuration for easymotion
map <leader>f <Plug>(easymotion-s)
map <leader>/ <Plug>(easymotion-sn)

" Configuration for Nerd-tree
map <leader>d :NERDTreeToggle<CR>
autocmd VimEnter * NERDTreeToggle
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeChDirMode=2
let g:NERDTreeDirArrowExpandable='>'
let g:NERDTreeDirArrowCollapsible='^'

" Configuration for Verilog
" let g:verilog_syntax_fold_lst="all"

" Configuration for jedi-vim
let g:jedi#use_splits_not_buffers = "left"
autocmd FileType python setlocal completeopt-=preview
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 3000
let g:jedi#popup_on_dot = 0

" Configuration supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

map <leader>a ggVG
map <leader>h :vertical resize -10<CR>
map <leader>j :resize -10<CR>
map <leader>k :resize +10<CR>
map <leader>l :vertical resize +10<CR>

" Configuration for TagBar
map <leader>t :TagbarToggle<CR>

" Set filetype of ".v.pyv" to verilog
autocmd BufNewFile,BufRead *.v.pyv set ft=verilog

" Set filetype pf ".h.pyv" to verilog
autocmd BufNewFile,BufRead *.v.pyv set ft=verilog

" No linebreak for latex files
autocmd BufNewFile,BufRead *.tex set tw=0 wrapmargin=0
autocmd BufNewFile,BufRead *.bib set tw=0 wrapmargin=0

" wider text width for python source files
autocmd BufNewFile,BufRead *.py set tw=118 sts=4 ts=4 sw=4

" use 2-space indent for protobuf (following Google's coding style)
autocmd BufNewFile,BufRead *.proto set sts=2 ts=2 sw=2

" use default indent and text width for markdown files
autocmd BufNewFile,BufRead *.md set tw=78 sts=4 ts=4 sw=4 ft=markdown

" xml syntax folding
let g:xml_syntax_folding = 1
augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END
