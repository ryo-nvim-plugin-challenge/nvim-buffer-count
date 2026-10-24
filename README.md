# nvim-buffer-count

still empty ...

# Answer to challenge

## What the API actually returns

`:ls!` と同じ結果を返すみたい。

`:ls` の方が期待される結果に近いと思う。存在するすべてのバッファを数えても困る。

```
1 #h   "plugin/nvim-buffer-count.lua" line 11
```

例えばこんな感じでバッファは状態を持っている。これのフラグ部分でどんな状態なのかがわかる。


| フラグ | 意味 |
| - | - |
| u | unlisted (:ls には出ない) |
| % | カレントバッファ |
| # | 代替バッファ (:b# で戻る先) |
| a | active : ロード済みで、ウィンドウに表示中 |
| h | hidden : ロード済みだが、どのウィンドウにも表示されていない |
| (aもhもなし) | ロードされていない |
| - / = | modifiable オフ / readonly |
| R / F / ? | terminal バッファ (実行中 / 終了 / 不明) |
| + | 未保存の変更あり |
| x | 読み込みエラーあり |

## What counts as an "open" buffer

`vim.bo[bufnr].buflisted`で表示されているバッファかどうかを確認できる。

## How much interpretation is left to you

今回はbuflistedがtrueのバッファのみをカウントするようにした。

他にも、現在のウィンドウに絞ってカウントするとかもできそう。
