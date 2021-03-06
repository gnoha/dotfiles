set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-airline/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16'
Bundle 'junegunn/fzf.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'mileszs/ack.vim'
Bundle 'mkitt/tabline.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/gitignore'
Bundle 'vim-scripts/nextval'
Bundle 'vim-scripts/regreplop.vim'

" VTS Commands
command! Db edit db/structure.sql

let mapleader = ","

cabbrev W w
cabbrev Q q
cabbrev Wq wq

map \           :NERDTreeToggle<CR>
map \|          :NERDTreeFind<CR>
nnoremap <Leader>f :FZF .<CR>
map <leader>/   <plug>NERDCommenterToggle
map <leader>, :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>m :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
map Y yg_
inoremap jk <Esc>

vmap <C-c> "*y
nmap <C-p> "*p

nmap <C-]> gt
nmap <C-[> gT
nnoremap tt :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap to :tabonly<CR>

au FocusLost * silent! wa

syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set vb    " Silence audio notifications

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost .git/index set nolist

autocmd BufRead,BufNewFile *.json set filetype=javascript

function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.* call StripTrailingWhitespace()

let NERDSpaceDelims = 1

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set guifont=Menlo\ for\ Powerline:h12
set guioptions-=T                  " Remove GUI toolbar
set guioptions-=e                  " Use text tab bar, not GUI
set guioptions-=rL                 " Remove scrollbars
set guicursor=a:blinkon0           " Turn off the blinking cursor

set notimeout                      " No command timeout
set showcmd                        " Show typed command prefixes while waiting for operator
" set mouse=a                        " Use mouse support in XTerm/iTerm.

set expandtab                      " Use soft tabs
set tabstop=2                      " Tab settings
set autoindent
set smarttab                       " Use shiftwidth to tab at line beginning
set shiftwidth=2                   " Width of autoindent
set number                         " Line numbers
set nowrap                         " No wrapping
set backspace=indent,eol,start     " Let backspace work over anything.
set wildignore+=tags,tmp/**        " Ignore tags when globbing.

set list                           " Show whitespace
set listchars=trail:·

set showmatch                      " Show matching brackets
set hidden                         " Allow hidden, unsaved buffers
set splitright                     " Add new windows towards the right
set splitbelow                     " ... and bottom
set wildmode=list:longest          " Bash-like tab completion
set scrolloff=3                    " Scroll when the cursor is 3 lines from edge
set cursorline                     " Highlight current line

set laststatus=2                   " Always show statusline

set incsearch                      " Incremental search
set history=1024                   " History size
set ignorecase
set smartcase                      " Smart case-sensitivity when searching

set autoread                       " No prompt for file changes outside Vim

set swapfile                       " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set sessionoptions-=options

set hls                            " search with highlights by default
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

set autowriteall                   " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall

if $TERM == 'screen-256color'
  set t_RV=[>c
endif

" FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~25%' }

" Goyo
noremap <Leader>gy :Goyo<CR>
noremap <Leader>gg :Goyo!<CR>
let g:goyo_width = 130
let g:goyo_height = '95%'

" Ack vim
let g:ackprg = 'ag --vimgrep'

let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show unicode glyphs

autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"

let ruby_operators=1

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

runtime macros/matchit.vim

highlight clear SignColumn
call gitgutter#highlight#define_highlights()

let g:rails_projections = {
  \ "frontend/javascripts/app/*.js": {
  \   "alternate": "spec/javascripts/{}_spec.js"
  \ },
  \ "spec/javascripts/*_spec.js": {
  \   "alternate": "frontend/javascripts/app/{}.js"
  \},
  \ "frontend/javascripts/app/*.coffee": {
  \   "alternate": "spec/javascripts/{}_spec.coffee"
  \ },
  \ "spec/javascripts/*_spec.coffee": {
  \   "alternate": "frontend/javascripts/app/{}.coffee"
  \}}

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {'mode': 'active'}

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction
