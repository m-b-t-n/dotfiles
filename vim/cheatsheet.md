# My Cheat Sheet

## All of lists

| cmd               | description                                  |
|-------------------|----------------------------------------------|
| tabnew            | タブを新規に開く                             |
| gt                | 次のタブに移動する                           |
| gT                | 前のタブに移動する                           |
| :nohl             | 検索した単語のハイライトを解除する           |
| :%!xxd            | hexdump っぽく変換する                       |
| :buffers          | バッファの一覧を表示する                     |
| :ls               | 同上                                         |
| :vsp #{buf_num}   | {buf_num} 番目のバッファを垂直分割で開く     |
| :sp #{buf_num}    | {buf_num} 番目のバッファを水平分割で開く     |
| :make             | PlantUML 図を生成する                        |
| :TableModeEnable  | テーブルモードに入る                         |
| :TableModeDisable | テーブルモードを抜ける                       |
| :help @en         | 英語版のヘルプを表示する                     |

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

| mode   | cmd | original_cmd                 | description                        |
|--------|-----|------------------------------|------------------------------------|
| NORMAL | gd  | <Plug>(coc-definition)       | 定義先ファイルに飛ぶ               |
| NORMAL | gy  | <Plug>(coc-type-definition)  | typedef の定義先ファイルに飛ぶ     |
| NORMAL | gi  | <Plug>(coc-implementation)   | 実装先に飛ぶ                       |
| NORMAL | gr  | <Plug>(coc-references)       | 参照されているリスト               |
| NORMAL | K   | :call s:show_documentation() | (filetype == vim) ヘルプを表示する |
|        |     |                              | docs をポップアップ表示する        |
| NORMAL | F2  | <Plug>(coc-rename)           | 一括リネームする                   |

