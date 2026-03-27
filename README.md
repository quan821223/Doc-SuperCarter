# Doc-SuperCarter

這個 repo 目前定位為 SuperCarter 的文件網站與變更紀錄整理區。

目前採用的原則很單純：

- 正式閱讀入口是整個 MkDocs 網站。
- 版本更新只維護一份 `docs/CHANGELOG/CHANGELOG.md`。
- 首頁只摘出最新版本摘要，不另外維護獨立的 Release Notes。
- 需要離線分享時，再從建好的網站輸出單檔 HTML。

## 目前資訊架構

- 首頁：`docs/index.md`
- 完整變更紀錄：`docs/CHANGELOG/CHANGELOG.md`
- 最新版本摘要：由 `hooks/generate_latest_changelog.py` 在 build 前自動產生到 `docs/_generated/latest-changelog.md`

目前站點設定已調整為比較符合現況的命名：

- Site name: `SuperCarter Documentation`
- Site description: `SuperCarter 文件網站與變更紀錄`

## 文件策略

這次整理後，不再把內容硬拆成「使用手冊 / CHANGELOG / Release Notes」三套彼此獨立的文件。

改成以下模式：

- 想看完整內容與較好的閱讀體驗，就看整個網站。
- 想快速知道最近改了什麼，就看首頁的最新版本摘要。
- 想看完整歷史，就看 `CHANGELOG`。
- 想離線分享，就輸出單檔 HTML。

這樣可以避免：

- 同一份版本資訊重複維護
- 不同頁面描述不一致
- Release Notes 與 CHANGELOG 逐漸分叉

## 建置方式

使用 repo 內的虛擬環境：

```powershell
.\scdoc\Scripts\python.exe -m mkdocs build
```

輸出網站目錄：

```text
site/
```

## 離線輸出

### 1. 匯出整站閱讀版

```powershell
.\tools\export-offline-html.ps1
```

預設輸出：

```text
offline-manual.html
```

用途：保留整體閱讀體驗，適合完整文件離線分享。

### 2. 匯出 CHANGELOG 單頁版

```powershell
.\tools\export-changelog-standalone.ps1
```

預設輸出：

```text
changelog-standalone.html
```

用途：只給別人看版本變更，接近 `htmlark CHANGELOG/CHANGELOG/index.html -o changelog-standalone.html` 這種使用情境，但已整合進 repo 流程。

## 相關腳本

- `tools/export-offline-html.ps1`
  - 先建站，再把 `print_page` 內嵌成單檔 HTML
- `tools/export-changelog-standalone.ps1`
  - 先建站，再把 `site/CHANGELOG/CHANGELOG/index.html` 內嵌成單檔 HTML
- `tools/inline_print_page.py`
  - 可指定輸入與輸出路徑，將 HTML 依賴資源內嵌成單檔
- `hooks/generate_latest_changelog.py`
  - 從 `CHANGELOG.md` 擷取最新已發布版本，產生首頁摘要

## 目前已完成的調整

- 將首頁改為以「單一來源」為核心說明
- 首頁補上離線分享方式
- 將站點名稱從 `User Manual` 調整為 `Documentation`
- 讓離線匯出流程支援整站版與 CHANGELOG 單頁版
- 將單檔 HTML 預設輸出到 repo 根目錄，避免被後續 `mkdocs build` 清掉
- 調整 `mkdocs.yml` 中 plugin 順序，讓 `print-site` 放在最後

## 已驗證

以下指令已實際執行通過：

```powershell
.\tools\export-changelog-standalone.ps1
.\tools\export-offline-html.ps1
```

目前可見產物：

- `changelog-standalone.html`
- `offline-manual.html`

## 目前仍保留的狀態

- `docs/CHANGELOG/CHANGELOG.md` 有既有未提交修改，這次沒有覆蓋
- `site/` 目錄是建置產物，會隨 `mkdocs build` 更新
- `docs/` 下仍有一些頁面尚未放回 `nav`，MkDocs build 會顯示 warning；這次未處理
