# CHANGELOG - SuperCarter
> from AMSC
> 所有顯著變更都會記錄在此檔案中。
> 本專案遵循 [Semantic Versioning](https://semver.org/lang/zh-TW/) 版本規範。

[TOC]

---

## [Unreleased]

**✨ 新增**

- （尚未釋出的功能請記在此處）

---

## [1.10.4] - 2026-03-25

What's changed since 1.10.3

**✨ 新增**

- Remedy Monitor 1.0 Powersupply interface not support
- 修改功能檢測 init_function 詢問 SC_FW, SC_HW, SE_FW, SE_HW

**🐞 修復**

- 移除功能檢測SC_FW, SC_HW測試項目

**♻️ 調整**

- 無


## [1.10.3] - 2026-03-20

What's changed since 1.10.2

**✨ 新增**

- 修正 TB 觸控測試秒數約 5 秒, 座標蒐集 Timeout設定 4.5 秒

**🐞 修復**

- 無

**♻️ 調整**

- 無


## [1.10.2] - 2026-03-16

What's changed since 1.10.1

**✨ 新增**

- 無

**🐞 修復**

- 修改 TB 觸控事件蒐集座標資料的方式

**♻️ 調整**

- 修改 IsContinuousCommandSending 的設置
- 修改 sampletest 恢復 第三部分的報告結果
- 修改 ambient test 調控介面
- 修改即時性的 CS_LE005 指令發送方式
- 修改 ALS 監控報告輸出
- 修改 ALS 監控封包解析器流程
- 修改 ALS 監控報告格式
- 修改 ALS 監控 TestParameter 指令項目
- 修改 ALS 監控 FIDM 目標選擇
- 修改ALS 基本參數傳遞綁定
- 修改ALS 基本參數傳遞綁定
- 修正 CL-200A 發送指令
- 修正 ID 30 為固定 CL-200A發送介面


## [1.10.1] - 2026-03-09

What's changed since 1.10.0

**✨ 新增**

- 無

**🐞 修復**

- 修正 Ambient light test 色溫與照度的錯位錯誤
- 修改功能檢測報告格式中顯示，診斷的字串均須顯示

**♻️ 調整**

- 移除關於功能檢測報告格式中 3 : Label function的項目


## [1.10.0] - 2026-03-05

What's changed since 1.9.8

**✨ 新增**

- 修改 SC SE 裝置版本顯示
- 修改 SC SE 裝置版本封包解析邏輯

**🐞 修復**

- 修改 ambient ligth sensor test 測試流程
- 修改 ambient ligth sensor test 報告書出
- 修改 ambient ligth sensor test 報告格式
- 修改 ambient ligth sensor test 指令
- 修改自動化配置模組的設定 - Lock鎖的邏輯設定
- 修改 TB touch的等待時間
- 修改 TB touch buffer 封包封包分析
- 修改自動化配置模組的版本更新
- 修改 TB 模式下的平行處理程序 Test-Condition, Test-Parameter
- 修改 chamber 模式下的運行機制 - 隨著腳本 block 的數量變化

**♻️ 調整**

- 修改 IMonitorStepHandler 繼承的寫法


## [1.9.8] - 2026-02-05

What's changed since 1.9.6

**✨ 新增**

- 修改 TB 監控模式腳本指令轉換屬性遺漏 issue (#31)

**🐞 修復**

- 無

**♻️ 調整**

- 無


## [1.9.7] - 2026-02-03

What's changed since 1.9.6

**✨ 新增**

- 無

**🐞 修復**

- 修改 TB 監控模式報告內容
- 修改 sampletest hmf 測試程序的流程

**♻️ 調整**

- 無


## [1.9.6] - 2026-01-30

What's changed since 1.9.5

**✨ 新增**

- 修改 TB模式 運行策略判斷

**🐞 修復**

- 無

**♻️ 調整**

- 無


## [1.9.5] - 2026-01-23

What's changed since 1.9.4

**✨ 新增**

- 建置FA屬性(為了二次發送)[not test]

**🐞 修復**

- 修改 TestBench_config_RuntimeStrategy 載入的條件(誤移AdaptiveRuntimeOptimizationStrategy項目)

**♻️ 調整**

- chore: ReportViewer format


## [1.9.4] - 2026-01-22

What's changed since 1.9.3

**✨ 新增**

- 建立Ambient Light Test 腳本編輯頁面
- 建立Color temperature Test 腳本編輯頁面
- 建立Ambient Light Sensor 屬性模組
- 建立Color temperature Test 屬性模組
- 建立 ReportViewer 的草稿

**🐞 修復**

- 修改 TB 模式觸擊測試的參數
- 修改 TB 模式觸擊流程
- 修改 COM baudrate 顯示與設定的方式

**♻️ 調整**

- 無


## [1.9.3] - 2026-01-05

What's changed since 1.9.2

**✨ 新增**

- 建置EOL的測試項目

**🐞 修復**

- 修改 sampletest 靜態電流的先行等待時間
- 修改 sampletest 觸控的中間座標的規格

**♻️ 調整**

- 無


## [1.9.2] - 2025-12-18

What's changed since 1.9.1

**✨ 新增**

- 修改 sampletest Check_TouchatMiddleCornor_5finger 的允許範圍
- 修改 sampletest Check_TouchatMiddleCornor_10finger 的允許範圍
- 修改 sampletest測試用圖
- 修改 sampletest 目視檢驗的視窗模板

**🐞 修復**

- 無

**♻️ 調整**

- 無


## [1.9.1] - 2025-12-15

What's changed since 1.9.0

**✨ 新增**

- 無

**🐞 修復**

- 修改 sampletest 輸出報告中觸控 NG 的描述資訊(原本沒有)
- 修改 hmf 模組
- 無

**♻️ 調整**

- 無


## [1.9.0] - 2025-11-24

What's changed since 1.7.28

**✨ 新增**

- 無

**🐞 修復**

- TB 模式 觸發運行過程鎖住相關參數介面的操作

**♻️ 調整**

- 將原先軟體計算部分拆分
- 移除說明的頁面


## [1.7.22] - 2025-09-30

What's changed since 1.7.21

**✨ 新增**

- 無

**🐞 修復**

- 修改功能檢測的 Echo 溫度顯示

**♻️ 調整**

- 無


## [1.7.21] - 2025-09-19

What's changed since 1.7.18

**✨ 新增**

- 修改 Testbench 資料輸出合併電流欄位的數據
- 數據長度從 5 萬行變成 10 萬行

**🐞 修復**

- 修改 sampletest 的 serialnumber 的位址
- 修改 sampletest 外觀檢測的文字敘述於輸出的測試報告中
- 修改 Sampletest SE 溫度顯示與計算方式
- 修改  Testbench SE 溫度顯示與計算方式
- 修改 scrolling SE 溫度顯示與計算方式
- 修改 scrolling SE 溫度小數點顯示
- 修正 sampletest 測試項目的文字說明於靜態電流的檢測於特殊電壓下

**♻️ 調整**

- 移除 功能檢測初期電壓顯示


## [1.7.7] - 2025-08-11

What's changed since 1.7.5

**✨ 新增**

- 無

**🐞 修復**

- 修改 sampletest 測試項目族群的名稱
- 修改 移除Voltage Tolerance 的睡眠模式的監控
- 修改 sampletest 電壓上下限的計算方式
- 修改 sampletest 觸控計時方式
- 修改 sampletest 觸控的運行方式與監控方法
- 修改 sampletest 當結束程序時須使echo進入安培檔位
- 修改 Testbench monitoring 當結束程序時須使echo進入安培檔位
- 修改電壓的計算方式，採用百分比容差
- 修改 sampletest 參數配置的格式
- 修改監控程序的ALS 屬性
- 修改電壓上限計算方式
- 修改電壓移除下限
- 移除 sampletest rawdata欄位
- 修改功能檢測電源供應的設置方式
- 修改IRS (x6)的狀態暫由 預設(x4)替之
- 修改 Sampletest  設置Powermode的統一方法

**♻️ 調整**

- 無


## [1.7.5] - 2025-08-05

What's changed since 1.7.4

**✨ 新增**

- 無

**🐞 修復**

- 修改電流顯示方式
- 修改 touch idletime 的時間控制
- 修改監控腳本的位址顯示
- 修改監控程序的目標屬性被清除的動作
- 修改安培檔位的小數點取用的顯示方式
- 修改安培檔位的小數點取用的機制
- 修改即時監控的電流顯示
- 修改監控程序 外部電壓值使其分配給所有通道

**♻️ 調整**

- 無


## [1.7.4] - 2025-08-04

What's changed since 1.6.48

**✨ 新增**

- 無

**🐞 修復**

- 修改溫溼度顯示異常
- 修正溫度 offset 的數值
- 修正 TX[n]feedbackVol 輸出錯位
- 修正 TX[n]DisplayAngle 輸出錯位
- 修改 降低 Remote ctrl table 電流設定

**♻️ 調整**

- 無


## [1.6.51] - 2025-07-28

What's changed since 1.6.48

**✨ 新增**

- [x] Normal/Sleep
- [x] Brightness
- [x] Pattern/Image
- [x] PowerSupplyVoltage (Remote ctrl)
- [x] SuperCarrier button Enable/Disable
- [x] SuperEcho button Enable/Disable
- [x] Display Power on/off
- [x] Remote Ctrl Dashboard of Power supply(just "unlock")
- [x] SuperCarrier SW Reset
- [x] Read SC/SE - FW/HW ver.
- [x] Add Sleep sequence (with poweroff)
- [x] 讀取 superecho 感測器收集的方式
- [ ] 監控資料輸出的報告異常
- [ ] 功能檢查電流取用
- [ ] 功能檢查與設備連結

**🐞 修復**

- 修改 Testbench 偵測硬體裝置流程,採多工形式
- 修改 將 toml 檔案形式修改成 yaml

**♻️ 調整**

- UCS_DQA Supercarrier 2.0_20250724.xlsx


## [1.6.48] - 2025-07-15

What's changed since 1.6.43

**✨ 新增**

- 無

**🐞 修復**

- 修改 隨插隨拔 Super 裝置偵測方法(採基本PIP識別)
- 修改 Outputdata的預設路徑(監控方法/Testbench)
- 修改 同步運行 (SyncPoint)於 Outputdata 指令的(timeout 5sec)
- 修改 監控流程的 TargetIMG 的設置方式
- 修改 SuperEcho 感測器視圖加入格線
- 修改 Testbench 腳本轉化的程序-> 移動到運行腳本之前
- 修改 執行緒競爭於 Testbench 監控時
- 修改 ShareQ 未正常關閉造成資料截斷的現象(kill all analysisQ token after Finished monitorinng)
- 修改 JSON script editor 預設路徑

**♻️ 調整**

- chore: ignore buld output and archives
- Fited: TestBench TargetIMG function.
- Refactor: Testbench outputdata interface


## [1.6.44] - 2025-06-27

What's changed since 1.6.43

**✨ 新增**

- 無

**🐞 修復**

- 修改接收方式改為同步方法於監控模式
- Fixed Power Supply  Detection err
- 修改 Device-mapping table 的屬性變化(顏色)

**♻️ 調整**

- Update TouchPad@v1.7.3
- Update ISP@v5.1
- chore: ignore buld output and archives
- chore: adjust gitignore


## [1.6.42] - 2025-06-17

What's changed since 1.6.41

**✨ 新增**

- Add Refresh SuperDevice when the SuperDevice be removed.

**🐞 修復**

- 修正 workflowIndex 給 SendAndReceiveDatabatchQ 超出規格的問題
- 修正 SuperEcho 裝置的執行緒異常遭占用
- 修正 TB 頁面
- 修正 監控系統的接收方法
- 修正 TBMM 裝置匹配
- Fit Nlog.config content

**♻️ 調整**

- 修改 SH85 數量 3 -> 2
- 移除 Measurement devices selection and enable SH85
- 移除SH85 卡控項目


## [1.6.41] - 2025-06-04

What's changed since 1.6.40

**✨ 新增**

- 無

**🐞 修復**

- 修改JSON當中於舊版 delaytime 屬性名稱 轉化成 IdleTime ，使其向下兼容
- 修改LightSensor偵測的部分程式碼
- 修改硬體偵測的superEcho感測器的屬性顏色變化根據本身屬性
- 修改硬體偵測配置方法
- 修改偵測的計算方法
- 修改自動化偵測格式
- 修改 JSON 另存基本腳本的預設檔案名稱

**♻️ 調整**

- 無


## [1.6.40] - 2025-05-21

What's changed since 1.6.39

**✨ 新增**

- 無

**🐞 修復**

- 修正 通訊接口 發送的流程
- 修正 錯誤訊息回饋的判斷機制

**♻️ 調整**

- TestBench 視覺頁面
- 變數綁定


