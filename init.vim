"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kikuchi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/kikuchi/.cache/dein')
  call dein#begin('/Users/kikuchi/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kikuchi/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  
  " Configure toml file path
  let s:toml_dir  = '/Users/kikuchi/.config/nvim'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " Caching toml file
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme tender

set sm
set ai
if !has('gui_running')
  set t_Co=256
endif

set tabstop=2
set shiftwidth=2
set number
set expandtab
set nowrap
set laststatus=2
set statusline=%F%m%r%h%w
set noshowmode

syntax enable
hi LineNr ctermfg=7
hi CursorLineNr ctermbg=7 ctermfg=0
set cursorline
hi clear CursorLine

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let NERDTreeShowHidden = 1

if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

function s:MoveToFileAtStart()
  call feedkeys("\<c-w>\<c-w>")
endfunction

autocmd VimEnter *  NERDTree | call s:MoveToFileAtStart()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
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

let g:ale_fixers = {
      \ 'javascript': ['prettier-eslint']
      \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:lightline = {
      \ 'active': {
      \   'right': []
      \ },
      \ 'inactive': {
      \   'right': []
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  let home = $HOME
  if stridx(path, 'NERD_tree') > 0
    return ''
  endif
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  if path[:len(home)-1] ==# home
    return '~/' . path[len(home)+1:]
  endif
  return expand('%')
endfunction

:command Tig TigOpenProjectRootDir

nnoremap <ESC><ESC> :noh<CR>
