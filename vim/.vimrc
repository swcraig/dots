set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Use sensible defaults and the latest Ruby
Plugin 'tpope/vim-sensible'
Plugin 'vim-ruby/vim-ruby'

" My own choices
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'int3/vim-extradite'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rake'

call vundle#end()
filetype plugin indent on
syntax on

let mapleader = ','
colorscheme koehler

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set number
set expandtab
set softtabstop=2
set shiftwidth=2
set textwidth=80

" Auto-wrap at 80, but don't insert an EOL character
set wrap linebreak nolist

" Only use spellcheck for commit messages
autocmd FileType gitcommit setlocal spell

" Stop using the arrow keys you dummy
noremap <left> <nop>
noremap <down> <nop>
noremap <up> <nop>
noremap <right> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

" Why is the escape key so far away?!
imap ii <Esc>
imap II <Esc>

noremap Q :q!<CR>

nmap <left> <<
nmap <right> >>

nmap <down> ddp
nmap <up> ddkP

let g:ackprg = 'ag --smart-case'
" let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev Ag Ack
cnoreabbrev aG Ack
cnoreabbrev AG Ack

" Highlight the 80th column
set t_Co=256
set cc=81
hi ColorColumn ctermbg=217

inoremap ZZ <Esc>:wq<CR>
inoremap WW <Esc>:w<CR>
inoremap QQ <Esc>:q!<CR>
noremap WW <Esc>:w<CR>

set clipboard=unnamedplus

set undofile " vim can use undo files to save changes between opening/closing
set undodir=~/.vimundo " folder to save vim undo files. needs to exist first

" The ohya autocommand grouping, which is the best autocommand grouping
augroup ohya

  " When I open a file
  " Jump to the last cursor position unless it is unavailable
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

augroup END

" Multipurpose the tab key
" If we are at the start of a new line, indent
" If we are on a character, attempt to tab complete
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function GetPrLink()
  let word = expand("<cword>")
  let pr_number = system('git pr ' . word)
  let repo_name = substitute(system("git repo"), '\n', '', '')
  execute '!sensible-browser ' . 'https://github.com/' . repo_name . '/issues/' . pr_number
endfunction

nnoremap <leader>a :call GetPrLink()<CR>

nnoremap <Leader>b :TagbarToggle<CR>
