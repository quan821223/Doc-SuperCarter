# 執行模式

本章說明 SuperCarter 腳本系統目前可看出的主要執行方式，以及在監控流程中的腳本掛載方式。

## 腳本執行的基本觀念

目前程式中的腳本不只有一種執行方式。依場景不同，大致可以分成：

- 直接執行單筆指令
- 執行指令序列
- 在監控模式中作為 `TestCondition`
- 在監控模式中作為 `TestParameter`

這些模式雖然共用部分資料結構，但用途不同。

## 單筆指令模式

在一般腳本編輯器中，單筆 `ScriptItemtype` 可以直接對應一條待送出的命令。

當 `CMDType1Parm = CMD` 時，系統會依設定：

- 解析 `HEX` 或 `ASCII`
- 視需要附加 `CR`、`LF`、`CRLF`
- 轉成實際送出的位元組資料

這種模式最適合做單步驗證或簡單通訊測試。

## Macro 模式

當 `CMDType1Parm = Macro` 時，系統不是直接執行 `Command` 欄位，而是會去讀取對應的 Macro 檔案，並展開為 `SubSequences`。

這表示：

- 一筆腳本項目可以代表一整組子腳本
- Macro 本質上是可重複使用的指令集合
- 適合把常見流程封裝起來

## Delay 與 System 類型

依目前欄位設計，`CMDType1Parm` 也支援：

- `Delay`
- `System`

這代表腳本列不一定都是對外部裝置送 UART 指令，也可以描述流程控制或系統層級操作。

目前文件先以「可作為流程控制列」理解即可；若後續這兩類型有更明確 UI 流程，再建議補充專章。

## 監控模式

在監控腳本中，腳本通常不是直接平鋪執行，而是掛在 Task 內的兩個位置：

- `TestCondition`
- `TestParameter`

### TestCondition

`TestCondition` 可視為前置條件或條件性檢查用腳本。

常見用途：

- 先確認裝置狀態
- 先做必要的準備動作
- 在任務開始前進行條件判斷

系統會計算：

- `TestConditionCycletime_ms`

另外 Task 還可設定：

- `IsSingleThread_TestCondition`

表示條件腳本是否以單執行緒方式處理。

### TestParameter

`TestParameter` 可視為週期性參數腳本，用於執行期間反覆讀取或驗證。

常見用途：

- 讀取感測值
- 讀取裝置參數
- 進行週期性檢查

系統會計算：

- `TestParameterCycletime_ms`

## MainLoop 與 Block / Task 執行

監控腳本的高層執行結構包括：

- `Mainloop`
- `BlockNodeList`
- 每個 Block 的 `Loop`
- 每個 Task 的 `Duration_s`

目前程式會依這些值估算：

- Block cycle time
- Block total time
- 全程估計時間

因此腳本執行不是單純「照順序跑完一次」，而是具備多層迴圈概念：

- 主流程迴圈
- Block 迴圈
- 指令本身的 Loop

## Test Bench 匯入模式

在 Test Bench 畫面中，使用者可匯入 JSON 腳本。

依目前實作：

- 開檔預設路徑來自 `ROOT_DIR_Path_TB_script`
- 載入後會更新 `Scheduledscriptpath`
- 再由 `MonitoringScriptLoader` 載入腳本內容
- 接著把資料套用到監控程式中執行

也就是說，Test Bench 偏向「載入既有監控腳本並執行」，而不是從零開始編輯。

## 錯誤與同步相關行為

腳本執行時，部分欄位會影響同步與檢查方式：

- `SyncPoint`
- `gtResponse`
- `TimeOut`
- `IsExtenDetectFunc`
- `DetectHandle`

這些欄位會決定：

- 是否等待回應
- 是否進行額外檢查
- 何時視為逾時或異常

## 使用建議

- 想重複使用一組操作流程時，優先考慮做成 Macro 或 Script Library
- `TestCondition` 與 `TestParameter` 的目的不同，應分開設計
- 匯入到 Test Bench 的 JSON 腳本應先確認路徑、版本與內容一致
- 若估計時間異常，通常需要檢查 `IdleTime`、`Loop`、Task 週期與 Block 迴圈設定
