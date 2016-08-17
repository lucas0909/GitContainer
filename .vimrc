"Sample .vimrc file by Lucas Arlt
"Setting up vim with pathogen.vim

"simple solution for removing delay from insert to exit mode
"set esckeys

execute pathogen#infect()
syntax on

" All of your Plugins must be added before the following line
filetype plugin indent on    " required

" Settings for powerline
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_heigth = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"Settings for python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b 0import ipdb; ipdb.set_trace() #BREAKPOINT<C-c>
"let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

"Better navigating through omnicoplete option list

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Setting python folding
set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Anything that exceeds the line length will be hightlighted black
augroup vimrc_autocmd
	autocmd!
	" highlight characters past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
augroup END

"" SOURCE: https://www.youtube.com/watch?v=YhqsjUUHj6g 

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","


" Better copy & paste
set pastetoggle=<F2>>
set clipboard=unnamed

" Mouse and backspace
set mouse=a 
set bs=2

" bind Ctrl+<movement> keys to move around windows, instead of using
" Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
vnoremap < <gv  
vnoremap > >gv  

" showing line numbers and length
set number 	" show line numbers
set tw=120	" width of document (used by gd)
set nowrap	" dont automatically wrap on load
set fo-=t	" dont automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233

" Real programmers dont use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
    
" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile







































