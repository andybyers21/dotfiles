""""""""""""""""
""" SETTINGS """
""""""""""""""""

syntax on
set number                      " show line numbers
set textwidth=80                " Hard-wrap long lines as you type them.
set modeline                    " Enable modeline.
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set gdefault                    " Use 'g' flag by default with :s/foo/bar/.
set magic                       " Use 'magic' patterns (extended regular expressions).
map q <Nop>                     " Turn off recording

""""""""""
"""TABS"""
""""""""""

set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype markdown setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype hmtl setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"""""""""""""""""
"""SPELL CHECK"""
"""""""""""""""""

" Auto spell check, GB, for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb

""""""""""""""
""" REMAPS """
""""""""""""""
 
" Map <leader> to <space> while also keeping <bslash>
let mapleader =" "
nmap <bslash> <space>

" Don't switch to insert mode after insert new line
nnoremap o o<Esc>
nnoremap O O<Esc>

" Add line above and below, move to center 
map <Leader>o oO

" Add two lines (for python)
map <Leader>O OoO

" Move to end of current line
map <Leader>RHL <Plug>VimwikiRemoveHeaderLevel      " Remove vimwiki mapping
map - $

" Buffer Navigation
nnoremap <Leader>p :bp<CR>      " previous buffer
nnoremap <Leader>n :bn<CR>      " next buffer
nnoremap <Leader>f :bf<CR>      " first buffer

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"""""""""""""""
""" PLUGINS """
"""""""""""""""

call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'chun-yang/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'dracula/vim'
    Plug 'vimwiki/vimwiki'
    Plug 'sakshamgupta05/vim-todo-highlight'
call plug#end()

"""""""""""""""
""" VimWiki """
"""""""""""""""

set nocompatible
filetype plugin on
syntax on

" Disable the creation of temporary wikis in all markdown files
let g:vimwiki_global_ext = 0

" give vimwiki access to all keymaps
let g:vimwiki_key_mappings = { 'all_maps': 1, }

" Set location & format
let g:vimwiki_list = [{'path': '~/Documents/Nota/2021_Notes/', 
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" add .md to markdown links
let g:vimwiki_markdown_link_ext = 1

"""""""""""""""
""" Dracula """
"""""""""""""""

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme dracula


""""""""""""""""
""" NerdTree """
""""""""""""""""

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeStatusline = ''
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


"""""""""""""""
""" Airline """
"""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1

"""""""""""
""" COC """
"""""""""""

" Use <tab> to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

