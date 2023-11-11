" ~/.vimrc

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

" coc autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ctrl+space
" Plug 'vim-ctrlspace/vim-ctrlspace'


call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" onedark theme
Plugin 'joshdick/onedark.vim'

" syntax highlighting
Plugin 'bfrg/vim-cpp-modern'

" clang-format
Plugin 'cjuniet/clang-format.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" syntax
Plugin 'scrooloose/syntastic'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax on

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=

set number
set cc=80

autocmd Filetype make setlocal noexpandtab

" tab lenght
set tabstop=4
set shiftwidth=4
set expandtab

" hidden chars
set list listchars=tab:»·,trail:·

" change dir on change file
:set autochdir

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ctrl+space config
" set nocompatible
" set hidden
" set encoding=utf-8

" airline config
let g:airline_theme='deus'
let g:airline_powerline_fonts=1

" onedark colorscheme
colorscheme onedark

" transparent terminal form windows-terminal
hi Normal guibg=NONE ctermbg=NONE

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" clang-format
let g:clang_format_style="file:/home/augustin.begue/.clang-format"
