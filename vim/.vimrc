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

call vundle#end()
filetype plugin indent on
syntax on

colorscheme koehler

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set number
set expandtab
set softtabstop=2
set shiftwidth=2

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

" Let me copy to the system clipboard
vnoremap <C-c> "+y

nmap <left> <<
nmap <right> >>
