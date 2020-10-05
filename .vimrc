"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"	set fileencodings=ucs-bom,utf-8,latin1
"endif

let g:is_posix = 1
set nocompatible
set bs=indent,eol,start
set history=500
set ruler
set number
"set relativenumber
set wrap
syntax on
"set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd
set mouse=a
set mousemodel=popup
set mousehide
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showmatch
set wildmenu
set term=screen-256color
set ttymouse=sgr

" Panes config
set splitbelow
set splitright
noremap <C-w>= :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>[ :vertical:resize -5<CR>
noremap <C-w>] :vertical:resize +5<CR>



" Use UTF-8 without BOM
set fileencodings-=latin1
set fileencodings+=cp1251
set encoding=utf-8 nobomb

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=50

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed,unnamedplus

" Error bells are displayed visually.
" set visualbell
" Disable error bells
set noerrorbells

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title



" Status line
" Always show status line
set laststatus=2
" http://stackoverflow.com/a/10416234/1284255
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


if bufwinnr(1)
  map Up <C-W>+
  map Down <C-W>-
endif

augroup project
	    autocmd!
	    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

if has("autocmd")
	augroup freebsd
	autocmd!
	if $PORTSDIR != ""
		autocmd BufNewFile $PORTSDIR/*/*/Makefile 0r $PORTSDIR/Templates/Makefile
	else
		autocmd BufNewFile /usr/ports/*/*/Makefile 0r /usr/ports/Templates/Makefile
	endif
endif


