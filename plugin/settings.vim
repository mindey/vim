" | vim-airline | {{{
let g:airline_powerline_fonts = 1 " Use airline fonts

if v:version >= 703
  let g:airline#extensions#tabline#enabled = 1
endif

" Define the shortform set of text to display
" for each mode
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'c' : 'C',
  \ 'v' : 'V',
  \ 'V' : 'V',
  \ '' : 'V',
  \ 's' : 'S',
  \ 'S' : 'S',
  \ '' : 'S',
  \ }

" Airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_z = airline#section#create_right(['%{g:airline_symbols.linenr}% %3l:%2c'])

" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}

" | jedi-vim | {{{
let g:jedi#popup_on_dot = 1

let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#smart_auto_mappings = 0
" }}}

" | ultisnips | {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" | indentLine | {{{
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character
let g:indentLine_char=nr2char(0xA6)
" }}}

" | vim-htmldjango_omnicomplete | {{{
if has("autocmd")
  au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
endif
" }}}

" | nerdtree | <leader>e{{{
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = nr2char(0xE5FF)
let g:NERDTreeDirArrowCollapsible = nr2char(0xE5FE)
let NERDTreeIgnore = ['\.pyc$']

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
" }}}

" | Commands List | <leader>: | {{{
" Show Commands <leader>,
nnoremap <leader>: :Commands<CR>
" }}}

" | vim-gitgutter | {{{
let g:gitgutter_max_signs=10000
" }}}

" | Syntastic | {{{

" Disable signs just show inline errors
let g:syntastic_enable_signs=0

" Syntastic python syntax checkers
let g:syntastic_python_checkers=['flake8', 'python']

" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E128 continuation line under-indented for visual indent
"   E711 comparison to None should be 'if cond is not None:'
"   E301 expected 1 blank line, found 0
"   E261 at least two spaces before inline comment
"   E241 multiple spaces after ':'
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
    \ --max-line-length=84'
" }}}

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | List toggle | <leader>l | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close the current buffer and move to the previous one | <leader>w | {{{
nnoremap <silent> <leader>w :bp <BAR> bd #<CR>
" }}}

" | Quickly jump by declarations list | <leader>s |{{{
nnoremap <silent> <Leader>s :BTags<CR>
" }}}

" | Buffer list | <leader>b | {{{
nnoremap <silent> <Leader>b :Buffers<CR>
" }}}

" | Open files | <leader>f | {{{
nnoremap <silent> <Leader>f :Files<CR>
" }}}

" | Switch between the last two files | <leader><leader> {{{
nnoremap <leader><leader> <c-^>
" }}}

" | Search word under cursor by using Ag | <leader>a | {{{
noremap <silent><Leader>a :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" | Color options | {{{
set background=dark
let base16colorspace=256
colors base16-eighties
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
" }}}

" vim:foldmethod=marker:foldlevel=0
