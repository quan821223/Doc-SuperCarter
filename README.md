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

### 1. 建立虛擬環境

建議直接使用 repo 內的腳本：

```powershell
.\tools\setup-venv.ps1
```

這個腳本會：

- 在 repo 根目錄建立 `scdoc` 虛擬環境
- 依 `requirements.txt` 安裝相依套件
- 輸出後續啟用與執行 MkDocs 的指令

如果需要重建已壞掉或搬移過路徑的 venv，可執行：

```powershell
.\tools\setup-venv.ps1 -Recreate
```

如果只想建立 venv、不安裝套件，可執行：

```powershell
.\tools\setup-venv.ps1 -SkipInstall
```

也可以手動執行：

```powershell
python -m venv scdoc
```

### 2. 啟用虛擬環境並安裝相依套件

```powershell
.\scdoc\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

如果不想先啟用，也可以直接使用虛擬環境內的 Python 安裝：

```powershell
.\scdoc\Scripts\python.exe -m pip install -r requirements.txt
```

### 3. 建置網站

使用 repo 內的虛擬環境：

```powershell
.\scdoc\Scripts\python.exe -m mkdocs build
```

本機預覽：

```powershell
.\scdoc\Scripts\python.exe -m mkdocs serve
```

輸出網站目錄：

```text
site/
```

## 離線輸出

離線分享分成兩種情境：

- 如果只想給人看單一版本變更，可輸出 CHANGELOG 的獨立 HTML。
- 如果要保留完整樣式、導覽與整體閱讀體驗，則輸出整站的離線版。

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

### 3. 匯出 SEE10 補充文件單頁版

```powershell
.\tools\export-see10-supplemental.ps1
```

預設輸出：

```text
see10-supplemental-notes.html
```

用途：只分享 SEE10 補充文件，不需要整站離線包。

## 相關腳本

- `tools/export-offline-html.ps1`
  - 先建站，再把 `print_page` 內嵌成單檔 HTML
- `tools/export-changelog-standalone.ps1`
  - 先建站，再把 `site/CHANGELOG/CHANGELOG/index.html` 內嵌成單檔 HTML
- `tools/export-see10-supplemental.ps1`
  - 先建站，再把 `site/see10-supplemental-notes/index.html` 內嵌成單檔 HTML
- `tools/setup-venv.ps1`
  - 建立或重建 `scdoc` 虛擬環境，並安裝 `requirements.txt`
- `tools/inline_print_page.py`
  - 可指定輸入與輸出路徑，將 HTML 依賴資源內嵌成單檔
- `hooks/generate_latest_changelog.py`
  - 從 `CHANGELOG.md` 擷取最新已發布版本，產生首頁摘要

## 部署到 GitHub Pages

這個專案可以直接部署到 GitHub Pages，讓使用者透過網路查看文件，不需要自行安裝環境。

### 1. 前置條件

- 已有 GitHub 帳號
- 已將此 repo push 到 GitHub
- repo 內容包含 `mkdocs.yml`、`docs/`、`requirements.txt`

### 2. 建議的網址形式

如果 repo 名稱是 `Doc-SuperCarter`，GitHub Pages 網址通常會是：

```text
https://<你的 GitHub 帳號>.github.io/Doc-SuperCarter/
```

如果之後有自訂網域，再另外綁定即可。

### 3. 在 `mkdocs.yml` 補上 `site_url`

建議在 `mkdocs.yml` 設定：

```yaml
site_url: https://<你的 GitHub 帳號>.github.io/Doc-SuperCarter/
```

這樣 sitemap、canonical URL 與部分主題功能會比較正常。

### 4. 建立 GitHub Actions 部署流程

在 repo 中新增檔案：

```text
.github/workflows/deploy-pages.yml
```

內容可使用：

```yaml
name: Deploy Docs to GitHub Pages

on:
  push:
    branches:
      - main
      - master
      - CL_main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          python -m pip install -r requirements.txt

      - name: Build site
        run: python -m mkdocs build

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: site

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### 5. 在 GitHub 啟用 Pages

到 GitHub repo 頁面操作：

1. 進入 `Settings`
2. 打開 `Pages`
3. 在 `Build and deployment` 選擇 `GitHub Actions`

設定完成後，之後只要 push 到指定 branch，就會自動部署。

### 6. 推送後確認部署結果

每次 push 後，可在 GitHub 的 `Actions` 頁面確認 workflow 是否成功。

成功後可在：

```text
https://<你的 GitHub 帳號>.github.io/Doc-SuperCarter/
```

看到最新文件站內容。

### 7. 常見注意事項

- 如果 repo 名稱不是 `Doc-SuperCarter`，網址最後一段會跟著 repo 名稱改變。
- 如果預設分支不是 `main`，要同步修改 workflow 內的 branch 名稱。
- 如果網站資源路徑錯誤，先確認 `site_url` 是否正確。
- GitHub Pages 適合靜態網站，這個 MkDocs 專案可直接使用。
- 如果不想讓使用者直接看到 `github.io` 網址，可後續再綁自訂網域。

### 8. 本機建置與線上部署的差異

- 本機預覽使用：`.\scdoc\Scripts\python.exe -m mkdocs serve`
- 正式上線部署使用：GitHub Actions 執行 `python -m mkdocs build`
- GitHub Pages 只需要 `site/` 靜態輸出，不需要上傳 `scdoc/`

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

