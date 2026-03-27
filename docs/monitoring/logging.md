# Logging

本章說明 SuperCarter 目前的日誌結構與用途。

## 日誌位置

依目前程式設定，日誌主要寫在：

```text
%USERPROFILE%\Documents\SuperCarter\logs
```

程式啟動時也會自動建立此資料夾。

## 日誌分類

依目前 `NLog.config`，主要日誌會分成以下類型：

- `Communication`
- `Error`
- `Performance`
- `General`
- `Operation`

這些分類會各自寫入不同子資料夾與檔案。

## Communication Log

Communication Log 主要記錄：

- 通訊協定
- 傳送方向
- 訊息內容
- 序列化後的 payload

這類記錄適合用來追蹤：

- 指令送出內容
- 收到的回應
- gRPC 或序列埠通訊狀態

## Error Log

Error Log 主要用來記錄：

- 例外訊息
- StackTrace
- 通訊或監控流程中的錯誤

當使用者回報程式異常時，這通常是第一個應該查看的地方。

## Performance Log

Performance Log 用於記錄：

- 操作名稱
- 執行時間
- 是否成功

適合拿來追查：

- 某些操作是否明顯過慢
- 執行時間是否異常增加

## General Log

General Log 會記錄一般資訊與狀態訊息，例如：

- 啟動與關閉
- 流程切換
- 一般執行資訊

## Operation Log

Operation Log 側重操作面記錄，例如：

- 使用者執行了什麼操作
- 操作結果是否成功
- 操作附帶訊息

## 備援日誌

若正式 Logging 發生問題，程式中也保留了簡單備援寫法，可能落到：

```text
fallback.log
```

這通常代表正式 NLog 流程有異常。

## Serial Port 額外日誌

依目前 `SerialPortCommunicationHandler`，序列埠開啟後也會動態建立對應 log target。  
因此針對特定 COM Port 的問題，有時也可以從通訊相關日誌中找到線索。

## 建議查看順序

排查問題時，建議先看：

1. `Error`
2. `Communication`
3. `Operation`
4. `General`

如果是效能問題，再補看 `Performance`。
