" ===================== FUNCTIONS   ===================== 

function! ClipboardYank()
    let tmpfile = "/tmp/neovim_gaben_clipboard_plugin.tmp"
    :call writefile(split(@@, "\n"), "/tmp/neovim_gaben_clipboard_plugin.tmp")
    :silent exe "!cat \"".tmpfile."\" | clip.exe"
endfunction
function! ClipboardPaste()
    let @@ = substitute(system("paste.exe"), "\r", "", "g")
endfunction


" ===================== KEYBINDINGS ===================== 
let mapleader = " "
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Install :silent exe '!git config --global core.autocrlf input' | PlugInstall --sync | silent exe "!git config --global core.autocrlf true"<CR>

nmap <Tab> >>
nmap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

noremap <left>  <nop>
noremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>
nnoremap <CR> i<CR><ESC>
noremap <leader>r <Esc>:syntax sync fromstart<CR>

nnoremap <C-c> yy :call ClipboardYank()<CR>
nnoremap <C-v> :call ClipboardPaste()<CR>p

inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>


set hidden
nmap <leader>t :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>I

set ignorecase


" ===================== STYLING ===================== 
:set number relativenumber
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" ===================== PLUGINS ===================== 
"
" Install Vim-plug, a plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let gitAutoCRLF = system('git config --global core.autocrlf')
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'rakr/vim-one'
call plug#end()


" ===================== PLUGIN BINDINGS ===================== 
map <C-t> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules'

set runtimepath+=~/.config/nvim/plugins/deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let deoplete#num_processes = 1
set completeopt=menu,noinsert
let NERDTreeShowHidden=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:used_javascript_libs = 'react,requirejs,chai,handlebards'

colorscheme one
set background=dark

