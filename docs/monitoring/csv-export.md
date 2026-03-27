# CSV 輸出

本章說明 SuperCarter 目前監控資料與錯誤資料的 CSV 輸出行為。

## 輸出位置

依目前程式設定，監控輸出預設會寫入：

```text
%USERPROFILE%\Documents\SuperCarter\result
```

程式啟動時會自動建立此資料夾。

## 兩種主要輸出

目前可見的 CSV 輸出主要分成兩類：

- 監控量測資料
- 錯誤資料

## 監控量測資料

監控資料輸出由 `MonitordataOutputFormat` 負責，預設檔名格式類似：

```text
yyyyMMdd_HHmmss_<自訂名><裝置名>_Data.csv
```

資料內容會包含：

- 時間
- 主迴圈與 Block / Phase 資訊
- 溫度與濕度
- 外接電源值
- 目標 PowerMode / Pattern / Brightness
- 各組 Sample 的電壓、電流、Diagnostic、LightSensor、Touch 等欄位

## 錯誤資料

錯誤資料輸出由 `MonitorErrdataOutputFormat` 負責，預設檔名格式類似：

```text
yyyyMMdd_HHmmss_<自訂名><裝置名>_ErrData.csv
```

資料內容會包含：

- 時間
- Port 名稱
- Error type
- Loop / Block / Phase
- PowerMode
- 命令名稱
- 預期值
- 實際值
- Send command
- Receive command

## 檔案分段

目前資料輸出有列數上限概念：

- 一般監控資料預設上限約 `50000` 筆
- 錯誤資料也有相似的分檔邏輯

當超過上限時，系統會建立新的 CSV 檔案繼續寫入。

## 使用者自訂名稱

輸出檔名可附帶：

- `UserDefinedName`
- `DeviceName`

因此若你在流程中有設定自訂標識，檔名會更容易對應到實際測試批次。

## 常見用途

CSV 輸出通常用於：

- 監控結果留存
- 後續資料分析
- 錯誤追查
- 匯入 Excel 或其他分析工具

## 常見問題

### 沒有看到 CSV 檔案

請先確認：

- 監控流程是否真的有開始
- 輸出資料夾是否存在
- 程式是否有寫入權限
- 執行過程中是否提早中止

### 檔案名稱不好辨識

若有批次或設備區分需求，建議在流程中使用明確的自訂名稱，讓輸出檔名更容易辨識。
