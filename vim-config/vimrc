" General config
set viminfo='100,<999,s100  " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data
set nocompatible            " disable vi compatibility mode
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!

" Enable filetype
filetype indent plugin on

" Modify indenting settings
set autoindent              " autoindent always ON.

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" Mark trailing spaces depending on whether we have a fancy terminal or not
if &t_Co > 2
	highlight ExtraWhitespace ctermbg=1
	match ExtraWhitespace /\s\+$/
else
	set listchars=trail:~
	set list
endif

" Use a specific pipe ch
set fillchars+=vert:\┊

set noshowmode
set laststatus=1        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

" Shortcuts for switching the buffers
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
imap <C-N> <Esc>:bnext<CR>i
imap <C-P> <Esc>:bprev<CR>i

let mapleader=","

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a

" Double ESC the terminal to exit terminal-job mode.
tnoremap <Esc><Esc> <C-\><C-n>

" Search config
set hlsearch	" Highlight matching search patterns
set incsearch	" Enable incremental search
set ignorecase	" Include matching uppercase words with lowercase search term
set smartcase	" Include only uppercase words with uppercase search term

" Ident/Unident with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" Mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>

function ToggleMouse()
   if g:is_mouse_enabled == 1
      echo "Mouse OFF"
      set mouse=
      let g:is_mouse_enabled = 0
   else
      echo "Mouse ON"
      set mouse=a
      let g:is_mouse_enabled = 1
   endif
endfunction

" Disable autoident when pasting text
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
   set pastetoggle=<Esc>[201~
   set paste
   return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


