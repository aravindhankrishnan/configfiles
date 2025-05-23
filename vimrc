set nu
set hlsearch
set nowrap
set mouse=a
set autochdir
set autoread
set hidden
set ruler
set equalalways
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=8
"set clipboard=unnamed
set ttymouse=xterm2
set noswapfile
set paste

"for coding
set textwidth=120

" don't check inlcude path for tab completion. This searches all files in
" /usr/include/*
" Type set path to identify the paths vim tab completion searches
set complete-=i

" setting ctags file
set tags=~/lh-projects/snitch/tags;

"setting path to search for files
set path+=/home/aravindhan/lh-projects/snitch/**

" runtime path for CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" enabling mouse for vim inside tmux
"set ttymouse=xterm2

set guifont=Monospace\ 10
"On Linux set the guifont=Monospace\ 10
"To get the current font :set gfn

set cindent
set autoindent


execute pathogen#infect()
syntax on
filetype plugin indent on

"colorscheme desert

"To get the color scheme : git clone https://github.com/rafi/awesome-vim-colorschemes.git               
"" :colorscheme <Ctrl D> lists the colorschemes                                                           
colorscheme seoul256                                                                                  

let mapleader=","

" copy to clipboard in visual mode
vmap <Leader>y "+y

nmap <Leader>0 :so ~/.vimrc <cr>
nmap <Leader>1 :e ~/.vimrc <cr>
nmap <Leader>w :w <cr>
nmap <Leader>q :q <cr>

"vertical split
nmap <Leader>v :vnew % <cr>

" opening a new file
nmap <Leader>e :e 

" Finding a file. prompts for name
nmap <Leader>f :find 

"switch to the previous buffer
nmap <silent>,s :b# <cr>

"remove highlighting
nmap <silent>,rh :noh <cr>

"buffer explorer
nmap <silent>a <ESC> :BufExplorer <CR>

"Open NERD Tree
nmap <silent> <Leader>nt :NERDTree <cr>

"Close NERD Tree
nmap <silent> <Leader>nq :NERDTreeClose <cr>

"Save session and quit
nmap SQ <ESC>:SessionSave ~/.vim/sessions/session<cr>:wqa<cr>

"Save the current session
nmap SS <ESC> :SessionSave <cr>

"Save the current session as
nmap SA <ESC> :SessionSaveAs 

"List saved sessions
nmap SL <ESC> :SessionList <cr>

"Show last and current session
nmap SC <ESC> :SessionShowLast <cr>

"Highlight the current word under the cursor
nmap <silent> <Leader>m :match Visual '' <cr>

" Function and variable list in a separate window
nmap <Leader>x :TlistToggle <cr>

" CtrlP root foler to find files
" r - ancestor of the .git folder
" c - directory of the current file
" a - like 'c' but applies only when the current working directory outside of
"     CtlrP isn't a direct ancestor of the directory of the current file
let g:ctrlp_working_path_mode=0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0 

"Invoking CtrlP
nmap <silent> ,a :CtrlP  <cr>

function! ListSessions()
	if argc()==0
		execute 'SessionList'
	end
endfunction


"Loading all buffers again
nmap <silent> ,l :bufdo e <cr>

"GIT commands

"Going back to editing mode
nmap <silent> ,ge :Gedit <cr>

" gdit commit
nmap <silent> ,gc :Gcommit <cr>

" git diff
nmap <silent> ,gd :Gdiff <cr>

" git status
nmap <silent> ,gs :Gstatus <cr>

" git blame -- author (commit) info for each line.
nmap <silent> ,gb :G blame <cr>

" git state filename -- stage the current file to the index
nmap <silent> ,gw :Gwrite <cr>

" Lusty Buffer grep
nmap <silent> ,/ :LustyBufferGrep <cr>

" Lusty Buffer search
map <silent> ,z  :LustyBufferExplorer <cr>

vnoremap <silent> <c-s> :Strikethrough <cr>

" Toggling paste / no paste mode
nnoremap ,t :set paste!<CR>:set paste?<CR>

autocmd VimEnter * call ListSessions()

"Remove the thick bar for the vertical split
autocmd colorscheme * highlight VertSplit cterm=NONE guibg=NONE ctermbg=NONE

"Remove the thick bar for the vertical split
autocmd colorscheme * highlight VertSplit cterm=NONE guibg=NONE ctermbg=NONE


"Tab switches
map <C-h> <ESC>:tabprev <CR>
map <C-l> <ESC>:tabnext <CR>

"" cscope

"cs add ~/lh-projects/snitch/cscope.out

" Find functions that call this function
nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>

" Find files including this file
nmap <Leader>ci :cs find i <C-R>=expand("<cword>")<CR><CR>

" Find this definition
nmap <Leader>cd :cs find g <C-R>=expand("<cword>")<CR><CR>

" Find this file
nmap <Leader>cf :cs find f 

" Find this symbol
nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>

" mapping Ctrl+Space to Ctrl+n for autocomplete
"inoremap <Nul> <C-n>

"enabling mouse for vim inside tmux

"if has("mouse_sgr")
"  set ttymouse=sgr
"else
"set ttymouse=xterm2
"end

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
