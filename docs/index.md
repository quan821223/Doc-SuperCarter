# SuperCarter 

這個文件站現在採單一來源整理:

- 完整閱讀與較佳瀏覽體驗走整個網站。
- 版本變更只維護一份 [`CHANGELOG`](CHANGELOG/CHANGELOG.md)，首頁只摘出最新版本。
- 不另外拆一份 Release Notes，避免內容重複與版本不同步。

## 最新版本修正狀況

--8<-- "_generated/latest-changelog.md"

[查看完整 CHANGELOG](CHANGELOG/CHANGELOG.md)

## 離線分享

如果只想給人看單一版本變更，可在建站後輸出獨立 HTML：

```powershell
.\tools\export-changelog-standalone.ps1
```

如果要保留完整樣式、導覽與整體閱讀體驗，則輸出整站的離線版：

```powershell
.\tools\export-offline-html.ps1
```
