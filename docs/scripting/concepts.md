# 腳本系統概念

本章說明 SuperCarter 目前腳本系統的用途、檔案位置與基本組成。

## 腳本系統的用途

SuperCarter 的腳本系統主要用於兩類情境：

- 一般指令序列編輯與保存
- 監控流程的任務、區塊與條件設定

依目前程式設計，腳本不只是單純的指令清單，還會包含：

- 指令要送到哪個裝置
- 指令的資料格式與結尾符號
- 每筆指令的等待時間與逾時時間
- 是否需要額外的檢查邏輯
- 在監控模式下的 Block、Task、TestCondition、TestParameter 結構

## 預設腳本路徑

程式啟動時，會建立並使用使用者文件目錄下的腳本資料夾：

```text
%USERPROFILE%\Documents\SuperCarter\scripts
```

另外也會建立：

```text
%USERPROFILE%\Documents\SuperCarter\scripts\macro
```

程式會分別記住：

- `ROOT_DIR_Path_TB_script`
- `ROOT_DIR_Path_Monitor_script`

前者主要對應 Test Bench 匯入 JSON 腳本時的預設資料夾，後者主要對應監控腳本編輯器使用的預設資料夾。

## 腳本的兩種主要型態

### 1. 指令序列腳本

這類腳本由多筆 `ScriptItemtype` 組成，每筆腳本項目都可定義：

- `Device`
- `CMDType1Parm`
- `CMDFun1Parm`
- `Command`
- `IdleTime`
- `TimeOut`
- `Loop`
- `SyncPoint`
- 延伸偵測設定

一般來說，這類腳本適合用來描述裝置通訊流程。

### 2. 監控腳本

監控腳本以 JSON 保存，核心內容包括：

- `MainLoop`
- `EventPeriod`
- `ControllerModeHandle`
- `BlockNodeList`
- `ScriptLibList`
- `Thresholds`

其中 `BlockNodeList` 會再往下包含多個 Task，而每個 Task 又可以分成：

- `TestCondition`
- `TestParameter`

這也是目前 UI 中常見的兩條腳本匯入路徑。

## 指令來源

腳本編輯器會從命令庫載入可選指令群組，目前可見的主要來源包括：

- `CMD_SuperCarrier.json`
- `CMD_SuperEcho.json`
- `CMD_PowerSupply.json`

因此腳本編輯並不是完全自由輸入所有內容，而是結合命令庫與使用者自訂項目來建立。

## 檔案格式

依目前程式實作，腳本系統同時使用兩種保存格式：

- XML
- JSON

### XML

XML 主要用於保存指令序列，例如 `SaveScriptTestSequencefile()` 寫出的 `TestSuite/TestSequence/Command` 結構。

常見欄位包括：

- `Device`
- `CMDType1Parm`
- `CMDFun1Parm`
- `Command`
- `IdleTime`
- `TimeOut`
- `Loop`
- `SyncPoint`
- `DetectHandle`

### JSON

JSON 主要用於保存監控腳本，內容會包含：

- 主流程設定
- Block / Task 結構
- 測試條件與參數腳本關聯
- 閾值檢查設定

程式內也保留了舊名稱與新名稱之間的對應，例如：

- `Preliminary` 對應 `TestCondition`
- `Periodic` 對應 `TestParameter`
- `Series0` 對應 `SuperCarrier`
- `Series1` 對應 `SuperEcho`
- `Series3` 對應 `PowerSupply`
- `Delaytime` 對應 `IdleTime`

這代表目前系統在讀取舊腳本資料時，仍具備一定相容性。

## 腳本與監控任務的關係

在監控模式中，腳本通常不是直接整包執行，而是被拆分並掛到 Task 的不同欄位：

- `TestCondition` 用於前置條件或條件性檢查
- `TestParameter` 用於週期性測試或參數讀取

每個 Task 還會計算：

- `TestConditionCycletime_ms`
- `TestParameterCycletime_ms`

這些數值會進一步影響整個 Block 與程式的估計執行時間。
