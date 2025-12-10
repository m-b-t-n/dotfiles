# My Cheat Sheet

## Built-In and misc

| mode            | cmd                 | description                                    |
|-----------------|---------------------|------------------------------------------------|
| COMMAND         | tabnew              | タブを新規に開く                               |
| NORMAL          | gt                  | 次のタブに移動する                             |
| NORMAL          | gT                  | 前のタブに移動する                             |
| COMMAND         | :nohl               | 検索した単語のハイライトを解除する             |
| COMMAND         | :%!xxd              | hexdump っぽく変換する                         |
| COMMAND         | :buffers            | バッファの一覧を表示する                       |
| COMMAND         | :ls                 | 同上                                           |
| COMMAND         | :vsp #{buf_num}     | {buf_num} 番目のバッファを垂直分割で開く       |
| COMMAND         | :sp #{buf_num}      | {buf_num} 番目のバッファを水平分割で開く       |
| COMMAND         | :make               | PlantUML 図を生成する                          |
| COMMAND         | :help @en           | 英語版のヘルプを表示する                       |
| COMMAND         | :echo {VAR}         | 変数 {VAR} の中身を表示する                    |
| COMMAND         | :echo &{OPTION}     | オプション {OPTION} の中身を表示する           |
| COMMAND         | :e ++ff=unix        | fileformat を UNIX (LF) で開き直す             |
| COMMAND         | :setl ff=unix       | 同上                                           |
| COMMAND, INSERT | C-v + C-m           | CR 制御文字 (^M) を打つ                        |
| COMMAND         | :echo expand('%')   | 相対パスでファイル名を取得する                 |
| COMMAND         | :echo expand('%:p)' | 絶対パスでファイル名を取得する                 |
| COMMAND         | :r! shellcmd        | shellcmd の実行結果を挿入する                  |
| NORMAL          | ~                   | カーソル下の英字を {大文字, 小文字} に変換する |
| NORMAL          | g{u, U, ~}          | u は小文字, U は大文字, ~ は現在と逆           |
|                 |                     | `guiw` でカーソル下の単語をすべて小文字にする  |

## vimdiff

| mode   | cmd | description                          |
| ---    | --- | ---                                  |
| NORMAL | [c  | 前（上方）の diff の先頭へ移動する   |
| NORMAL | ]c  | 次（下方）の diff の先頭へ移動する   |
| NORMAL | do  | 今いる方に、隣から diff を持ってくる |
| NORMAL | dp  | 今いる方から、隣へ diff を入れる     |

## vim-table-mode

| mode   | cmd               | original_cmd      | description                |
|--------|-------------------|-------------------|----------------------------|
| NORMAL | C-t               | :TableModeToggle  | テーブルモードを切り替える |
| NORMAL | rl                | :TableModeRealign | テーブルを揃え直す         |

## winresizer

| mode   | cmd   | original_cmd           | description                                  |
|--------|-------|------------------------|----------------------------------------------|
| NORMAL | C-e   | :WinResizerStartResize | リサイズモードに入る                         |
| -      | Enter |                        | リサイズを確定する                           |
| -      | Esc   |                        | リサイズモードから抜ける（変更は破棄される） |
| -      | h     |                        | 現在のペインを左に拡大する                   |
| -      | j     |                        | 現在のペインを下に拡大する                   |
| -      | k     |                        | 現在のペインを上に拡大する                   |
| -      | l     |                        | 現在のペインを右に拡大する                   |

## coc.nvim

| mode   | cmd | original_cmd                 | description                                   |
|--------|-----|------------------------------|-----------------------------------------------|
| NORMAL | gd  | \<Plug>(coc-definition)      | 定義先ファイルに飛ぶ                          |
| NORMAL | gy  | \<Plug>(coc-type-definition) | typedef の定義先ファイルに飛ぶ                |
| NORMAL | gi  | \<Plug>(coc-implementation)   | 実装先に飛ぶ                                  |
| NORMAL | gr  | \<Plug>(coc-references)       | 参照されているリスト                          |
| NORMAL | K   | :call s:show_documentation() | (filetype == vim) ヘルプを表示する            |
|        |     |                              | (filetype != vim) docs をポップアップ表示する |
| NORMAL | F2  | \<Plug>(coc-rename)           | 一括リネームする                              |

