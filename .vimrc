"=======================================================
" NeoBundle
"=======================================================
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
" ステータスバーをかっこよく
NeoBundle 'bling/vim-airline'
" rails
NeoBundle 'rails.vim'
" ツリー表示
NeoBundle 'The-NERD-tree'
" Gitの操作
NeoBundle 'tpope/vim-fugitive'
" ファイルエクスプローラ (CTRL+P)
NeoBundle 'kien/ctrlp.vim'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
" Tomorrow Theme
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"=======================================================
" Basic
"=======================================================
"(no)swapファイルを作る
set noswapfile

"(no)undoファイルを作る
set noundofile

"(no)VimをなるべくVi互換にする
set nocompatible

"バックスペースキーの動作を決定する
"2:indent,eol,startと同じ
set backspace=2

"行番号を表示する
set number

"新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

"検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

"インクリメンタルサーチを行う
set incsearch

"highlight matches with last search pattern
set hlsearch

"タブ文字、行末など不可視文字を表示する
set list

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"保存しないで他のファイルを表示することが出来るようにする
set hidden

"カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

"Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"自動インデントの各段階に使われる空白の数
set shiftwidth=4

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"(no)ファイルを上書きする前にバックアップファイルを作る
set nobackup

"listで表示される文字のフォーマットを指定する
"※デフォルト eol=$ を打ち消す意味で設定
set listchars=tab:>-

"カーソルの上または下に表示する最小限の行数
set scrolloff=10

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

" grep(系コマンド)の後、自動でQuickfix開く
autocmd QuickFixCmdPost *grep* cwindow

"ビープ音すべてを無効にする
set visualbell t_vb=
"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells 
"行を強調表示
set cursorline

"=======================================================
" Keymaps
"=======================================================
" タブ移動
nnoremap <C-j> gT
nnoremap <C-k> gt
" grでカーソル下のキーワードをGgrep
nnoremap <silent><expr> g* ':Ggrep ' . expand('<cword>') . '<CR>'

"=======================================================
" FileTypes
"=======================================================
filetype on
filetype indent on

"=======================================================
" Color
"=======================================================
syntax enable
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
if ($ft=='ruby')
    colorscheme Tomorrow-Night
else
    colorscheme hybrid
endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#readonly#enabled = 0

let g:airline_theme='wombat'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_branch_prefix = '⭠'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'

"=======================================================
" ctrlp
"=======================================================
" デフォルトでファイル名検索
let g:ctrlp_by_filename = 1
" デフォルトで正規表現検索
let g:ctrlp_regexp = 1
" 高さ大きめ
let g:ctrlp_match_window = 'max:15'
" vim終了時にキャッシュクリアしない
let g:ctrlp_clear_cache_on_exit = 0

"=======================================================
" indent
"=======================================================
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" 手動で色設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=black
