# 支援設備

本章整理目前 SuperCarter 架構中可辨識或可操作的主要設備類型。

## 通訊型態

依目前程式結構，設備連線以 `COM` 為主，程式內也保留了 `TCPIP`、`UDP` 等型別列舉，但目前可見的主流程仍以序列埠設備為核心。

## 主要設備類型

依目前 `SuperDeviceType` 與相關掃描邏輯，可見的主要設備包括：

- `SuperCarrier`
- `SuperCarrierNofeature`
- `SuperEcho`
- `VideoSource`
- `PSW1080L222`
- `PSW720`

另外在腳本與通訊指令層中，也常見以下裝置名稱：

- `SuperCarrier`
- `SuperEcho`
- `PowerSupply`
- `SuperCarter`

## 腳本系統中的裝置名稱

在腳本編輯與監控腳本中，常用的目標裝置欄位包含：

- `All`
- `SuperCarrier`
- `SuperEcho`
- `PowerSupply`
- 數字型 Port ID

這些名稱不一定等同於最終 UI 顯示名稱，但會直接影響命令要送往哪個通訊處理器。

## SuperDevice 掃描群組

目前程式對設備掃描提供兩種群組概念：

- `ALL`
- `SuperDevice`

`SuperDevice` 模式會套用既定的 PnP Device ID 篩選規則，只掃描符合 SuperCarter 目前設備識別條件的裝置。

## 自動辨識依據

目前程式中會用來辨識設備的主要依據包括：

- Windows `Win32_PnPEntity`
- `ClassGuid`
- `PnPDeviceID`
- Registry 中的 `PortName`

因此裝置是否能被辨識，除了硬體本身之外，也和：

- 驅動是否正常
- 裝置是否正確枚舉成 COM Port
- 裝置的 PnP Device ID 是否符合程式篩選條件

有直接關係。

## 實務上可期待的設備能力

依目前程式內容，SuperCarter 會搭配下列能力使用設備：

- 一般序列通訊
- SuperCarrier 與其 TX 狀態辨識
- SuperEcho 量測或模組狀態使用
- Power Supply 命令送出
- 相機或影像來源配合操作

## 注意事項

- 即使裝置已插入，若 Windows 沒有正確建立 COM Port，程式仍可能看不到
- 腳本中使用的裝置名稱要和目前系統配置一致
- 若同一台設備被其他程式占用，可能會造成無法開啟或無法讀寫
