""" standard colour options
syntax enable
set background=dark
colorscheme PaperColor

""" document formatting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set hls is

""" word processor hack
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

filetype plugin indent on

""" solarized specific stuff
" let g:solarized_termcolors=256
" let g:solarized_termtrans = 0 
" let g:solarized_degrade = 0 
" let g:solarized_bold = 1 
" let g:solarized_underline = 0 
" let g:solarized_italic = 0 
" colorscheme solarized
