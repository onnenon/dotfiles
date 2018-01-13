call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-surround'
call plug#end()

:imap jk <Esc>

let mapleader=","
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

au Filetype C
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au Filetype python
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au Filetype yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |

au Filetype sls
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |

au Filetype yml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

highlight BadWhitespace ctermbg=red guibg=red

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

" Enable folding
set foldmethod=indent
set foldlevel=99

colorscheme gruvbox
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
set background=dark
autocmd vimenter * NERDTree

set runtimepath^=~/.vim/plugged
set nu
set hlsearch

" NERDTree Settings
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>

" Spell check stuff
set termguicolors
set ft=markdown
set spell
set spelllang=en_us
let g:gruvbox_guisp_fallback='fg'
colo gruvbox
