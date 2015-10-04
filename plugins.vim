" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'

" Plug to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" An extensible & universal comment vim-plugin that also handles embedded
" filetypes
Plug 'tomtom/tcomment_vim'

" Plug which shows a git diff in the gutter (sign column)
" and stages/reverts hunks.
Plug 'airblade/vim-gitgutter'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Jedi for comfortable development with python
" TODO: jedi 0.9.0 library has issue with imports
" I'll fix this issue by using stable jedi version (0.8.1):
Plug 'davidhalter/jedi-vim', {'do': 'cd jedi/ && git checkout 7b402d7'}

" A nicer Python indentation style for vim.
Plug 'hynek/vim-python-pep8-indent'

" Javascript indenter (HTML indent is included)
Plug 'lukaszb/vim-web-indent'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', {'do': 'yes \| ./install'}
Plug 'junegunn/fzf.vim'

" Plug to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" For correct install color schemes pls read these notes
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-shell
" https://github.com/chriskempson/base16-iterm2
Plug 'chriskempson/base16-vim'

" htmldjango filetype omnicomplete - completes template tags/filters/variables
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

" asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

if has('nvim')
  " Adds neovim support to vim-dispatch
  Plug 'radenling/vim-dispatch-neovim', {'branch': 'foreground-terminal'}
endif

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'aliev/vim-python-tools'

call plug#end()
