set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive' "Git wrapper for vim
Plugin 'scrooloose/nerdtree'
"Plugin 'bling/vim-airline'
Plugin 'powerline/powerline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-surround'
"Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'gko/vim-coloresque'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

syntax on
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set spell spelllang=en_us
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
set t_Co=256

set splitbelow
set splitright

filetype plugin on
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}' 
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'wombat'
"let g:airline_solarized_bg='dark'
"let g:airline#extensions#hunks#enabled=0
"let g:airline#extensions#branch#enabled=1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#syntastic#enabled = 1
map <C-n> :NERDTreeToggle<CR>


"--------------------------------------*navigating*-----------------------------------------
"set shifting focus to different tabs using h j k l
:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
inoremap { {}<ESC>ha
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha


"-----------------------------------------*pep8*---------------------------------------------
"autocmd BufWritePost *.py call Flake8()
let g:toggleFlake8OnWrite= 1
function! ToggleFlake8OnWrite(...)
  if a:0 == 1 "toggle behaviour
    let g:toggleFlake8OnWrite= 1 - g:toggleFlake8OnWrite
    if g:toggleFlake8OnWrite== 0
        set textwidth=100
        echon "Flak8OnWrite On and textwidth set to 120 (ctrl-x to toggle flake8)"
    else
        set textwidth=10000
        echon "Flak8OnWrite Off and textwidth set to 10000 (ctrl-x to toggle flake8)"
    endif
  else
    if g:toggleFlake8OnWrite== 0 "normal action, do the hi
        call Flake8()
    endif
  endif
endfunction
autocmd BufWritePost *.py call ToggleFlake8OnWrite()
map <C-x> :call ToggleFlake8OnWrite(1)<CR>

"--------------------------*folding*----------------------------------------------------------
"if has('folding')
"    set foldmethod=indent     " folding works with indents
"    set foldlevel=99          " The higher the more folded regions are open.
"    set foldnestmax=1         " foldnestmax is the limit for nesting folds
"
"    " if you type h, when the cursor is at position 1, try to fold.
"    " TODO make folds open with l and not jump 1 character to the right
"    function! HFolding(count)
"      let counter = a:count
"      if (counter == 0)
"        let counter = 1
"      endif
"      let save_cursor = getpos(".")
"      if (save_cursor[2] == 1)
"        "echo save_cursor[2]
"        try
"          normal! za
"        catch /E490/ " (No fold found)
"          " we don't want that error, since that is not important (when using h)
"        endtry
"      else
"        exec "normal! ".counter."h"
"      endif
"    endfunction
"    "noremap h :normal! h<CR>
"    nnoremap h :<C-U>call HFolding(v:count)<CR>
"    " <C-R>=HFolding()<CR>
"endif

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

"below code gives powerline status bar
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx EmmetInstall
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1


" unmapping the arrow keys to master hjkl navigation
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

inoremap <Leader> <C-x><C-o>
