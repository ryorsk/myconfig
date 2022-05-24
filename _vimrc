
" 文字コードをUFT-8に設定
set fenc=utf-8

" バックアップ・スワップを作らない
set nobackup
set noswapfile

" 編集中のファイルが変更されたら自動で読み込み
set autoread

" 入力中のコマンドをステータスに表示
set showcmd

" 行番号を表示
set number

" スマートインデント
set smartindent

" 対応するカッコを表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" コマンドライン補完
set wildmode=list:longest

" 折り返し時に表示行単位での移動
nnoremap j gj
nnoremap k gk

" シンタックスハイライトの有効化
syntax enable

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" タブを半角スペース
set expandtab

" 行頭以外のタブ文字の表示幅
set tabstop=2

" 行頭でのタブ文字の表示幅
set shiftwidth=2

" 検索文字列のケースセンシティブ無効
set ignorecase

" 検索文字列に大文字が含まれている場合は区別
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
