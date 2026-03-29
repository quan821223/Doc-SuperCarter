# 參數設定

本章整理目前腳本系統中常見的欄位與設定意義，方便在編輯腳本時快速對照。

## 單筆腳本項目的常見欄位

一筆腳本資料目前主要由 `ScriptItemtype` 表示，常見欄位如下。

### `Device`

指定此命令要送往哪個裝置。

目前程式內建可見選項包括：

- `All`
- `SuperCarrier`
- `SuperEcho`
- `PowerSupply`
- `SuperCarter`
- 數字型 Port ID

其中部分名稱在轉換為實際執行資料時，會對應到固定的埠號或裝置類型。

### `MSGname`

此筆命令的名稱或說明文字。  
通常用來作為畫面顯示、記錄或輸出標識。

### `Command`

實際命令內容。

當資料格式為：

- `HEX` 時，命令會被解析成十六進位位元組
- `ASCII` 時，命令會以 ASCII 字串送出

### `CMDType1Parm`

命令類型。依目前實作，主要包含：

- `CMD`
- `Macro`
- `Delay`
- `System`

這個欄位會直接影響其他欄位是否可用，以及命令如何被展開與執行。

### `CMDType2Parm`

第二層命令分類。用途會依 `CMDType1Parm` 改變。

例如：

- 在 `Macro` 模式下，通常代表 macro 類別資料夾
- 在 `System` 模式下，可能對應系統功能群組

### `CMDFun0Parm`

目前常作為是否等待或要求回應的旗標，預設值常見為：

- `1`
- `0`

程式在轉換腳本時，會把它映射到 `gtResponse`。

### `CMDFun1Parm`

依類型不同，代表不同意義。

在 `CMD` 模式下，主要表示資料格式：

- `HEX`
- `ASCII`

在 `Macro` 模式下，則通常代表要載入的 macro 檔名。

### `CMDFun2Parm`

在一般 `CMD` 模式下，主要用來指定結尾字元：

- 空字串
- `CR`
- `LF`
- `CRLF`

### `IdleTime`

此命令送出後的等待時間，單位為毫秒。  
它也會直接影響整體腳本的估計時間。

### `TimeOut`

等待回應或檢查結果的逾時時間，單位為毫秒。

### `Loop`

此命令自身的執行次數。  
若上層還有 Block 或 MainLoop，實際總執行次數會再疊加。

### `SyncPoint`

表示此命令是否作為同步點。  
在多裝置或流程控制情境中，這個欄位會影響執行節奏。

### `IsExtenDetectFunc`

表示是否啟用額外偵測處理。

若啟用，通常會配合以下欄位：

- `DetectHandleDes`
- `DetectHandle`

### `DetectHandleDes`

額外偵測邏輯的說明文字。

### `DetectHandle`

額外偵測邏輯的實際內容，目前以字串形式保存，再於執行轉換時反序列化成對應檢查條件。

### `SubSequences`

當命令類型是 `Macro` 時，這裡會保存展開後的子指令序列。

## 監控腳本層級參數

除了單筆指令，監控腳本還有上層參數。

### `Mainloop`

整個監控腳本的主迴圈次數。  
若值過小，程式內部會至少修正為 1。

### `EventPeriod`

整體事件週期設定。  
通常用於描述監控流程執行節奏。

### `ControllerModeValue`

控制器模式設定。  
目前會寫入 JSON 腳本中的 `ControllerModeHandle`。

### `BlockNodeList`

整個監控腳本的主體結構。  
每個 Block 可再包含多個 Task。

### `ScriptLibList`

腳本庫清單，用來保存可重複使用的指令序列，並可匯入到 Task 中。

## Task 層級參數

每個 Task 目前常見的重要欄位包括：

- `TestConditionCommands`
- `TestParameterCommands`
- `TestConditionCMDsPath`
- `TestConditionCMDsFullPath`
- `TestParameterCMDsPath`
- `TestParameterCMDsFullPath`
- `TestConditionCycletime_ms`
- `TestParameterCycletime_ms`
- `IsSingleThread_TestCondition`

### `TestConditionCommands`

掛在 Task 上的條件腳本內容。

### `TestParameterCommands`

掛在 Task 上的參數腳本內容。

### `TestConditionCMDsPath` / `TestParameterCMDsPath`

顯示用的腳本檔名或相對路徑。

### `TestConditionCMDsFullPath` / `TestParameterCMDsFullPath`

實際完整路徑，用於後續重新載入或追蹤來源。

### `TestConditionCycletime_ms`

目前條件腳本的週期時間，通常由該序列所有 `IdleTime` 累加而成。

### `TestParameterCycletime_ms`

目前參數腳本的週期時間，通常由該序列所有 `IdleTime` 累加而成。

### `IsSingleThread_TestCondition`

表示條件腳本是否以單執行緒方式執行。

## 閾值設定

監控腳本還支援多種 Threshold 設定，目前可見的主要項目有：

- `NormalCurrent`
- `SleepCurrent`
- `Diagnostic`
- `LightSensor`
- `TouchDetect`

其中依型態不同，可能包含：

- `IsEnabled`
- `Upper`
- `Mean`
- `Lower`
- `TargetValue`
- `Tolerance`

## 舊名稱相容

程式目前對舊欄位名稱保留相容處理，常見對應如下：

- `Preliminary` -> `TestCondition`
- `Periodic` -> `TestParameter`
- `Series0` -> `SuperCarrier`
- `Series1` -> `SuperEcho`
- `Series3` -> `PowerSupply`
- `Delaytime` -> `IdleTime`

如果遇到舊版腳本檔案，系統仍可能透過這些轉換規則成功讀入。

## 設定建議

- 需要等待裝置回覆時，再明確設定回應相關欄位與逾時時間
- `IdleTime` 不宜設太小，避免裝置尚未完成前就進入下一步
- `Loop` 與上層 `Mainloop`、Block loop 會疊加，設定時要一併考慮
- 使用延伸偵測時，建議保留清楚的 `DetectHandleDes` 方便後續維護
