if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.local/share/nvim/site/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'w0rp/ale'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
"Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'roxma/vim-paste-easy'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
"" Plug 'Shougo/neosnippet'
"" Plug 'Shougo/neosnippet-snippets'
Plug 'wokalski/autocomplete-flow'
Plug 'mattn/emmet-vim'
Plug 'dag/vim-fish'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'termhn/i3-vim-nav'
call plug#end()

let mapleader = ","

" 24-bit truecolor support
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

" Colorscheme
syntax on
if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " No `bg` setting
end
colorscheme onedark
let g:onedark_terminal_italics = 1
"let g:airline_theme='onedark'
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Quickly open/reload vim
nnoremap <leader>ve :vsp ~/.config/nvim/init.vim<CR>  
nnoremap <leader>vs :source ~/.config/nvim/init.vim<CR>

" i3 integration
nnoremap <c-l> :call Focus('right', 'l')<CR>
nnoremap <c-h> :call Focus('left', 'h')<CR>
nnoremap <c-k> :call Focus('up', 'k')<CR>
nnoremap <c-j> :call Focus('down', 'j')<CR>

nnoremap <leader>w= <c-w>=

" Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>gy :Goyo<CR>
let g:goyo_width = 70
let g:goyo_height = 75
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" go stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

let g:ale_fixers = { 'javascript': ['prettier_standard'] }
let g:ale_linters = { 'javascript': ['flow', 'standard'] }
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#sources#_ = ['buffer']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:autocomplete_flow#insert_paren_after_function = 0
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function() abort
	  return deoplete#close_popup() . "\<CR>"
endfunction

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nnoremap <leader>nt :NERDTreeToggle<CR>

set number
set incsearch


set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set breakindent
set breakindentopt=shift:4

set clipboard=unnamed,unnamedplus
set mouse=a

set splitbelow
set splitright

set expandtab
set softtabstop=4
set shiftwidth=4
au FileType javascript setlocal sts=2 sw=2
au FileType go setlocal sts=8 sw=8

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

vnoremap < <gv
vnoremap > >gv
