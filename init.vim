call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-scripts/Zenburn'
Plug 'mattn/emmet-vim'
Plug 'jaredgorski/spacecamp'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'ervandew/supertab'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }


call plug#end()

" ---------------------- Plugin configs ----------------------------

set background=dark

" ******** color scheme **********
"colorscheme onedark
"colorscheme nord
"colorscheme spacecamp
"colorscheme gruvbox
"colorscheme onehalfdark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck
"autocmd BufEnter * colorscheme gruvbox
"autocmd BufEnter *.py colorscheme nord
"
syntax on
set t_Co=256
set cursorline

"let g:airline_theme='random'
"let g:airline_theme='base16_snazzy'
"let g:airline_theme='onedark'
"let g:airline_theme='alduin'
"let g:airline_theme='onehalfdark'
let g:airline_theme = 'spaceduck'
set laststatus=2



" ************** buildin Terminal ***************
"
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"********** NerdTree *************
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" ******* deoplete *******
"let g:deoplete#enable_at_startup = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"autocmd FileType html,css,js
"       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" ******* neoformat ******

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" *********** airline fonts **********
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ---------------------- Split navigation ---------------------------
:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>


" ---------------------- Default configs ----------------------------
syntax on
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set showmatch
set errorbells
set wrapmargin=2
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/
set incsearch
set number
set history=1000
set hls
set ignorecase
set smartcase
set t_Co=256set
set splitbelow
set splitright
set encoding=utf-8
set scrolloff=999
:let mapleader = " "
" file finding
" use :find <file_name(partial)> <tab>
set path+=**
set wildmenu
set cursorline
set relativenumber

" Enable folding
set foldmethod=indent
set foldlevel=99

"go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"rust
let g:rustfmt_autosave = 1


"fzf config
let g:fzf_layout = { 'down': '40%' }
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
nnoremap <silent> <space><space> :FZF<CR>


"configure inbuilt terminal
"escape exits terminal
:tnoremap <Esc> <C-\><C-n>

" search highlight
hi Search guibg=peru guifg=wheat


let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
