call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/wolandark/vim-live-server.git'
    Plug 'https://github.com/itchyny/lightline.vim'
    Plug 'https://github.com/vim-skk/skk.vim'
call plug#end()
let skk_large_jisyo = '~/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
set cursorline
set cursorcolumn
set laststatus=2
set imdisable
let g:lightline = {
\	'colorscheme':'one',
\	'background':'light'}
"wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz
" gzip -d SKK-JISYO.L.gz
