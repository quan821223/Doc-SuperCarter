# 即時監控

本章說明 SuperCarter 目前監控功能的核心結構與使用重點。

## 監控流程的基本概念

目前監控功能主要圍繞 Test Bench / Monitoring 程式進行。  
使用者通常會：

1. 匯入監控 JSON 腳本
2. 載入腳本內容
3. 啟動監控
4. 觀察目前迴圈、Block、Task 與量測結果

## 載入監控腳本

目前 Test Bench 會透過 `OpenFileDialog` 匯入 JSON 腳本，預設資料夾來自：

- `ROOT_DIR_Path_TB_script`

載入後會由 `MonitoringScriptLoader` 解析：

- `Mainloop`
- `EventPeriod`
- `BlockNodeList`
- 各 Task 的 `TestConditionCommands`
- 各 Task 的 `TestParameterCommands`
- Threshold 設定

## 啟動監控

目前監控啟動後，程式會：

- 建立取消權杖
- 套用當前錯誤策略
- 將 JSON 腳本內容套用到監控程式
- 開始執行監控主流程

執行中會持續更新：

- `Mainloop`
- 當前 Block
- 當前 Task
- 進度百分比
- 目標 PowerMode / ImagePattern / Brightness
- 環境相關數值

## 目前可觀察的監控資料

依目前程式內容，監控時可看到或記錄的資訊包含：

- 目前主迴圈
- Block 進度
- Task 進度
- Power Mode
- 圖像 Pattern
- Brightness
- 溫度與濕度
- 外接電源數值
- 電流、Diagnostic、LightSensor、Touch 等量測結果

## 錯誤處理策略

目前監控程式支援錯誤處理策略，至少包含以下概念：

- 繼續執行
- 停止執行
- 依錯誤數門檻決定

因此當監控中發生異常時，不一定會立刻終止，實際行為會受目前錯誤策略影響。

## 即時燈號與狀態

依目前 ViewModel，可看到監控啟動與停止時會切換狀態燈號，例如：

- 啟動後轉為綠色
- 停止時回到橘色

這類狀態可作為目前監控是否正在運行的快速判斷依據。

## 停止監控

目前停止監控時，系統會先詢問是否確認停止。  
確認後會：

- 取消目前流程
- 停止監控程式
- 重設部分狀態

## 使用建議

- 匯入腳本後先確認是否已成功載入
- 啟動前先確認設備已連線完成
- 若監控沒有開始，優先檢查 JSON 腳本路徑與設備數量
- 若監控中斷，先確認是手動停止、錯誤策略終止，還是設備通訊異常
