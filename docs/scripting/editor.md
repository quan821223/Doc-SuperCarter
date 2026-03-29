# 編輯器

本章說明目前 SuperCarter 中與腳本編輯有關的主要畫面與操作方式。

## 編輯器的兩條主線

依目前程式結構，腳本編輯主要分成兩種：

- 一般腳本編輯器
- 監控腳本編輯器

兩者都會使用 `ScriptItemtype` 作為基本指令資料，但使用情境不同。

## 一般腳本編輯器

一般腳本編輯器主要用於建立與保存指令序列。

其特點包括：

- 會載入裝置命令庫
- 可選擇不同裝置類型
- 可編輯單筆指令內容
- 可將腳本保存為 XML 格式

目前命令庫主要來自：

- `CMD_SuperCarrier.json`
- `CMD_SuperEcho.json`
- `CMD_PowerSupply.json`

因此使用者通常會先從命令群組中選擇合適的命令，再調整欄位參數。

## 監控腳本編輯器

監控腳本編輯器對應較高層級的流程編排。它不只編輯單筆指令，而是管理：

- `Block`
- `Task`
- `TestCondition`
- `TestParameter`
- `ScriptLib`

依目前程式行為，監控編輯器啟動時會先建立一個預設 Block，並以樹狀方式呈現。

### 監控腳本的典型流程

典型操作順序通常是：

1. 建立或開啟監控腳本
2. 新增 Block
3. 在 Block 內新增 Task
4. 匯入或指定 `TestCondition`
5. 匯入或指定 `TestParameter`
6. 設定週期、迴圈與其他欄位
7. 儲存為 JSON 腳本

這部分也和既有操作筆記中提到的「將腳本匯入 Task 的 TestCondition」一致。

## Script Library

監控腳本編輯器中有一個重要概念是 `ScriptLibList`。

它的用途是把可重複使用的指令序列集中管理，然後再寫入 Task：

- 寫入 `TestCondition`
- 寫入 `TestParameter`

依目前 UI 綁定，`ScriptLibraryView` 會提供：

- `WriteToTestCondition`
- `WriteToTestParameter`

也就是從腳本庫把現有序列指定到目前選取的 Task。

## 匯入與匯出

### 匯出

依目前實作：

- 一般指令序列可保存為 XML
- 監控腳本可保存為 JSON

### 匯入

監控腳本編輯器可以匯入既有腳本內容，並還原以下資料：

- `Mainloop`
- `EventPeriod`
- `ControllerModeValue`
- `BlockNodeList`
- `ScriptLibList`
- 各項 Threshold 設定

此外，Task 也可以分別掛入：

- `TestConditionCommands`
- `TestParameterCommands`

並保留對應的路徑資訊：

- `TestConditionCMDsPath`
- `TestConditionCMDsFullPath`
- `TestParameterCMDsPath`
- `TestParameterCMDsFullPath`

## 編輯器中常見的操作重點

### 新增指令

新增指令時，通常需要先決定：

- 目標裝置
- 指令類型
- 資料格式
- 實際命令內容

### 複製與重用

腳本系統支援將序列保存後再重複匯入使用，因此適合把常用流程做成 Script Library。

### 修改後重新計算

監控腳本中的 Block 與 Task 會重新計算：

- 條件腳本週期時間
- 參數腳本週期時間
- Block cycle time
- Block total time
- Program estimated time

因此當內容變更後，畫面中的估計時間也可能跟著改變。

## 實務建議

- 常用的固定流程建議整理成 Script Library，避免每次重新輸入
- `TestCondition` 與 `TestParameter` 建議分開管理，不要混成同一套序列
- 修改腳本後，建議確認目前選取的 Task 是否已同步更新
- 如果有清除腳本或重新匯入的動作，應重新確認 Task 名稱與腳本路徑欄位
