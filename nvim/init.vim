syntax on
set number              " show line numbers
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
map q <Nop>         " Turn off recording

" Buffer Navigation
nnoremap <Leader>p :bp<CR>      " previous buffer
nnoremap <Leader>n :bn<CR>      " next buffer
nnoremap <Leader>f :bf<CR>      " first buffer

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim'
" Plug 'alexpearce/nvim-follow-markdown-links', { 'do': ':UpdateRemotePlugins' }
" Plug 'walterl/downtools'
Plug 'vimwiki/vimwiki'
call plug#end()

" vimwiki
let g:vimwiki_list = [{'path': '~/Documents/Nota/2021_Notes/', 'syntax': 'markdown', 'ext': '.md'}]
" add .md to markdown links
let g:vimwiki_markdown_link_ext = 1

" dracula color scheme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" nerdtree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeStatusline = ''
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" airline settings
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

" COC
" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" follow markdown links
command! FollowMarkdownLink call FollowMarkdownLink()
command! PreviousMarkdownBuffer call PreviousMarkdownBuffer()
autocmd FileType markdown nnoremap <script> <CR> :FollowMarkdownLink<CR>
autocmd FileType markdown nnoremap <script> <BS> :PreviousMarkdownBuffer<CR>
let g:follow_markdown_links#extensions = ['.md', '.markdown']

" downtools
let g:downtools_disable_vlink_mapping = 1
