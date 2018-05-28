"============================================================================="
"       vim configuration - by dean poulos (dean.poulos7@protonmail.com)      "
"============================================================================="
" services include:                                                           "  
" - syntax highlighting using PaperColor                                      "
" - tabstopping at 4 spaces                                                   "
" - automatic text wrapping at 80 spaces                                      "
" - editor search highlighting                                                "
" - word processor mode function with spellchecking                           "
"============================================================================="
" prerequisites:                                                              "
" - PaperColor theme: https://github.com/NLKNguyen/papercolor-theme           "
"============================================================================="

" standard colour options
syntax enable
set background=dark
colorscheme PaperColor

" document formatting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set hls is

" word processor hack
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

filetype plugin indent on
