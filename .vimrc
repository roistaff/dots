call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/wolandark/vim-live-server.git'
    Plug 'https://github.com/itchyny/lightline.vim'
call plug#end()

set cursorline
set cursorcolumn
set laststatus=2
"SKKの辞書ファイルの場所
let skk_large_jisyo = '~/SKK-JISYO.L'
"ユーザ辞書を自動で保存する（お好みで）
let skk_auto_save_jisyo = 1
let g:lightline = {
\	'colorscheme':'one',
\	'background':'light'}
