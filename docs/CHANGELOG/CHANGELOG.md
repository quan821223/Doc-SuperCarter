# CHANGELOG - SuperCarter



> 所有顯著變更都會記錄在此檔案中。  
> 本專案遵循 [Semantic Versioning](https://semver.org/lang/zh-TW/) 版本規範。

  - 文件名稱：SuperCarter CHANGELOG
  - 文件版本：v1.0.0
  - 適用軟體版本：SuperCarter v1.10.4
  - 發布日期：2026-03-26
  - 維護單位：DQA
  
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
- 調整功能檢測 Sampletest Volspec 的位置

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

- 新增 CSLE005 分析器
- 新增 CL200A 分析器
- 新增 CL200A 即時顯示架構
- 新增預發送 CL200A 的啟動指令於監控流程當中

**🐞 修復**

- 修改 TB 觸控事件蒐集座標資料的方式
- 修改 TB 觸控事件運行的時間調整
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

**♻️ 調整**

- 修正 CL-200A 發送指令
- 修正 ID 30 為固定 CL-200A發送介面


## [1.10.1] - 2026-03-09

What's changed since 1.10.0

**✨ 新增**

- 新增 SC SE FIDM 版本名稱的欄位顯示
- 新增功能檢測報告格式中溫度的符號
- 新增功能檢測報告格式中濕度的符號

**🐞 修復**

- 修正 Ambient light test 色溫與照度的錯位錯誤
- 修改功能檢測報告格式中顯示，診斷的字串均須顯示

**♻️ 調整**

- 移除關於功能檢測報告格式中 3 : Label function的項目


## [1.10.0] - 2026-03-05

What's changed since 1.9.8

**✨ 新增**

- 新增 CL-200A 的流程狀態切換(部分完成)
- 新增 CL-200A 的監控流程(部分完成)
- 新增可調整的屬性項目，關於 COM
- 新增UCS 封包解析器
- 修改 SC SE 裝置版本顯示
- 修改 SC SE 裝置版本封包解析邏輯
- 新增 TB 報告格式 的屬性欄位: chamberstatus
- 新增 TB 報告格式 的屬性欄位: runtime option
- 新增 ParseFuncDA_Rd20 解析器
- 新增判斷是否進行訊號偵測當 runtime option 為外部設備主導時候
- 新增 ambient light light sensor test 即時性面板參數
- 新增 ambient light senser outputdata format
- 新增監控模式 1.0 的二次發送
- 新增監控模式 2.0 的二次發送 (Testbench)

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

- 新增 sampletest 增加 config名稱
- 新增 sampletest hmf 測試程序的啟用開關
- 新增 sampletest 測試資訊於報告內容中，關於 configuration file name
- 新增 sampletest 測試資訊於報告內容中，關於 HMF file name
- 新增 腳本資訊於 TB 監控模式報告中
- 新增 軟體版本資訊於 TB 監控模式報告中
- 新增 systeminfo 於 appdata 當中

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

- 新增觸控數值卡控策略於 sampletest 測試
- 新增觸控數值卡控描述於 sampletest 的輸出報告中
- 新增 hmf 相關的功能
- **修復**
- 修改 sampletest 輸出報告中觸控 NG 的描述資訊(原本沒有)
- 修改 hmf 模組

**🐞 修復**

- 無

**♻️ 調整**

- 無


## [1.9.0] - 2025-11-24

What's changed since 1.7.28

**✨ 新增**

- 新增監控模式選項 - 預設
- 新增監控模式選項 - 與爐子進行同步
- 新增監控模式選項 - 軟體自己運算
- 新增 HMF 檔案讀取
- 新增爐子狀態的選擇欄位於腳本屬性

**🐞 修復**

- TB 模式 觸發運行過程鎖住相關參數介面的操作
- 修復封包未接收的狀況(嘗試詢問三次暫存區域)

**♻️ 調整**

- 將原先軟體計算部分拆分
- 移除說明的頁面


## [1.7.22] - 2025-09-30

What's changed since 1.7.21

**✨ 新增**

- 新增條件切換的紀錄於功能檢測( #28)

**🐞 修復**

- 修改功能檢測的 Echo 溫度顯示

**♻️ 調整**

- 無


## [1.7.21] - 2025-09-19

What's changed since 1.7.18

**✨ 新增**

- 新增 block 運行的時間控制

**🐞 修復**

- 修改 sampletest 的 serialnumber 的位址
- 修改 sampletest 外觀檢測的文字敘述於輸出的測試報告中
- 修改 Sampletest SE 溫度顯示與計算方式
- 修改  Testbench SE 溫度顯示與計算方式
- 修改 scrolling SE 溫度顯示與計算方式
- 修改 scrolling SE 溫度小數點顯示
- 修正 sampletest 測試項目的文字說明於靜態電流的檢測於特殊電壓下
- 修改 Testbench 時間優化 在 block loop 運行上新增截斷機制
- 修改 Testbench 資料輸出合併電流欄位的數據
- 數據長度從 5 萬行變成 10 萬行

**♻️ 調整**

- 調整 sampletest 的 serialnumber 的頁面位置
- 調整 Testbench FA 系列 04 電壓精度調整
- 調整 Testbench 電流經度顯示(毫安培)
- 調整 Testbench 標題位置
- 移除 功能檢測初期電壓顯示


## [1.7.7] - 2025-08-11

What's changed since 1.7.5

**✨ 新增**

- 新增 觸控的監控流程
- 新增 sampletest 建置 wakeup voltage 測試項目
- 新增 obserableobj 繼承項目
- 新增Sampletest 實驗參數配置設定
- 新增 sampletest 關於 app version
- 新增 TB 監控系統 Touch 指令
- 新增 監控功能 轉態更新Testcondition 寫成NA
- 新增感測器配置模組化
- 新增功能檢測 測試項目加入中斷參數
- 新增 sampletest 溫溼度通訊

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

- 調整 sampletest 測試的開關機制


## [1.7.5] - 2025-08-05

What's changed since 1.7.4

**✨ 新增**

- 新增 觸控的監控流程

**🐞 修復**

- 修改電流顯示方式
- 修改 touch idletime 的時間控制
- 修改監控腳本的位址顯示
- 修改監控程序的目標屬性被清除的動作
- 修改安培檔位的小數點取用的顯示方式
- 修改安培檔位的小數點取用的機制
- 修改即時監控的電流顯示
- 修改監控程序 外部電壓值使其分配給所有通道
- 新增PowerSupplyStatus ON/OFF
- 新增即時監控的安培/微安培 欄位於介面中

**♻️ 調整**

- 無


## [1.7.4] - 2025-08-04

What's changed since 1.6.48

**✨ 新增**

- 新增 Duration 時間的等待
- 新增 ALS 的欄位

**🐞 修復**

- 修改溫溼度顯示異常
- 修正溫度 offset 的數值
- 修正 TX[n]feedbackVol 輸出錯位
- 修正 TX[n]DisplayAngle 輸出錯位
- 修改 降低 Remote ctrl table 電流設定

**♻️ 調整**

- 調整 ExecuteworkflowAsync 工作排程


## [1.6.51] - 2025-07-28

What's changed since 1.6.48

**✨ 新增**

- 新增版本顯示
- 新增對預留的Ack的長度與預設的長度做判斷
- 新增 詢問版本功能 針對 Super-series  FW HW
- 新增 版本功能的屬性 針對 Super-series  FW HW
- 新增 版本功能的顯示 針對 Super-series  FW HW
- 新增 詢問SuperEcho 當前裝置配置 的功能
- 新增 顯示 SuperEcho 當前裝置配置 的功能
- 新增控制面板的選單
- 新增控制面板的後端功能
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

- 新增 DB 系列指令(僅限基礎顏色)
- 新增 Test Bench 運行流程
- 新增 指令分析於 DB 系列(僅限基礎顏色)
- 新增 TestBench 裝置匹配功能
- 新增 TestBench 資料輸出
- 新增 感測器數值即時撥放的功能
- 新增 SuperEcho 感測器偵測機制
- 新增 SuperCarrier 匹配條件
- 新增 Super 系列的即時動態欄位
- 新增 TestBench Lcok 機制
- 新增 TestBench 感測器總表輸出
- 新增 Powermode 指令觸發廣播所有 Comport
- 新增 SuperEcho 電流策略的告知機制
- 新增 動態腳本分配的方法
- 新增 通訊指令的分析器

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

- 新增TestBench裝置感測試器的巡覽模式
- 新增腳本儲存提示
- 新增自動偵測 Super-device
- 新增 SuperEcho 硬體裝置的屬性
- 新增 監控功能的頁面

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

- 新增 SuperEcho 感測器數據為空集合的判斷
- 新增 SampleTest 新增測試項目 bootloader, partnumber
- 新增刷新通訊界面的 matrix
- 新增 TB 硬體更新與 COMPORT選取的更新
- 新增 TB 硬體偵測的更新
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

- 新增未知裝置圖示
- 新增基礎類別針對Testbench屬性
- 新增屬性轉化的條件 delaytime => IdleTime
- 新增 監控腳本 觸發清除基礎腳本程序，當觸發清除 TestCondition or TestParameter 後清除該項目的 hashcode

**🐞 修復**

- 修改JSON當中於舊版 delaytime 屬性名稱 轉化成 IdleTime ，使其向下兼容
- 修改LightSensor偵測的部分程式碼
- 修改硬體偵測的superEcho感測器的屬性顏色變化根據本身屬性
- 修改硬體偵測配置方法
- 修改偵測的計算方法
- 修改自動化偵測格式
- 修改 JSON 另存基本腳本的預設檔案名稱

**♻️ 調整**

- 調整 doc文件
- 調整型別通訊概念的型別，由介面改為抽象
- 調整 TestBench 硬體頁面的排版


## [1.6.40] - 2025-05-21

What's changed since 1.6.39

**✨ 新增**

- 新增 TestBench 硬體裝置的通訊機制
- 新增 TestBench 用圖

**🐞 修復**

- 修正 通訊接口 發送的流程
- 修正 錯誤訊息回饋的判斷機制

**♻️ 調整**

- TestBench 視覺頁面
- 變數綁定

