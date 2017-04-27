set nu
set hlsearch
set nowrap
set mouse=a
set autochdir
set autoread
set hidden
set ruler
set textwidth=80
set equalalways
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=8
set clipboard=unnamed

" enabling mouse for vim inside tmux
set ttymouse=xterm2

set guifont=Monospace\ 14
"On Linux set the guifont=Monospace\ 10
"To get the current font :set gfn

set cindent
set autoindent

colorscheme desert

execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

nmap <Leader>1 :e ~/.vimrc <cr>
nmap <Leader>w :w <cr>
nmap <Leader>q :q <cr>

"vertical split
nmap <Leader>v vnew % <cr>

" copy to OS clipboard
map <Leader>y "+y

" copy from OS clipboard
map <Leader>p "*p

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


" Function and variable list in a separate window
nmap <Leader>x :TlistToggle <cr>

function! ListSessions()
	if argc()==0
		execute 'SessionList'
	end
endfunction


"Loading the vimrc file
nmap <silent> ,0 :so ~/.vimrc <cr>

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
nmap <silent> ,gb :Gblame <cr>

" git state filename -- stage the current file to the index
nmap <silent> ,gw :Gwrite <cr>

" Lusty Buffer grep
nmap <silent> ,/ :LustyBufferGrep <cr>

" Lusty Buffer search
map <silent> ,z  :LustyBufferExplorer <cr>

vnoremap <silent> <c-s> :Strikethrough <cr>

autocmd VimEnter * call ListSessions()

"Remove the thick bar for the vertical split
autocmd colorscheme * highlight VertSplit cterm=NONE guibg=NONE ctermbg=NONE

"Remove the thick bar for the vertical split
autocmd colorscheme * highlight VertSplit cterm=NONE guibg=NONE ctermbg=NONE

"Tab switches
map <C-Left> <ESC>:tabprev <CR>
map <C-Right> <ESC>:tabnext <CR>

" mapping Ctrl+Space to Ctrl+n for autocomplete
inoremap <Nul> <C-n>

"enabling mouse for vim inside tmux

if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
