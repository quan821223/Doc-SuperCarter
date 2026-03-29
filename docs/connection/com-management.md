# COM 管理

本章說明 SuperCarter 目前如何管理 COM Port 與裝置對應。

## COM 連線的基本方式

目前 SuperCarter 的主要裝置通訊流程仍以序列埠為主。  
程式在開啟連線時，會使用以下典型參數：

- `PortName`
- `BaudRate`
- `Parity`
- `DataBits`
- `StopBits`

預設值中可見：

- `BaudRate` 預設為 `115200`
- `StopBits` 使用 `One`
- `Handshake` 使用 `None`

## UartMatrix

程式中使用 `UartMatrix` 來管理多組裝置對應。  
這個資料結構會以格狀或矩陣方式記錄：

- Port ID
- DeviceName
- 對應的 COM 設定

相關配置會保存到：

```text
DeviceLs.json
```

這表示裝置對應關係不是每次啟動都重新輸入，而是可被保存與重載。

## Port ID 概念

目前系統中常見的 Port ID 命名方式包括：

- `0` 到 `45` 的數字型識別
- `All`
- `SuperCarrier`
- `SuperEcho`
- `PowerSupply`

在腳本與通訊管理中，這些識別值會被映射到實際通訊處理器或邏輯裝置。

## 連線管理器

程式中的 `MultipleCommunicationManager` 會集中管理已註冊的通訊處理器，提供：

- 註冊處理器
- 開啟裝置
- 關閉裝置
- 送資料
- 收資料
- 查詢是否已連線

因此 COM 管理不是單一視窗的功能，而是整個應用程式共用的連線層。

## COM Port 開啟後的行為

依目前 `SerialPortCommunicationHandler` 實作，開啟連線時會：

- 設定序列埠參數
- 開啟 Port
- 清空 In/Out Buffer
- 建立對應的 SerialPort log target

這也表示：

- 若埠號錯誤，開啟時就可能失敗
- 若埠號被其他程式占用，也可能無法成功開啟

## 建議設定方式

- 先確認 Windows 裝置管理員中的實際 COM 號碼
- BaudRate 應與設備需求一致，若無特殊說明可先用 `115200`
- 同一設備避免同時被多個應用程式打開
- 若重新插拔設備導致 COM 號碼改變，需同步更新 SuperCarter 內設定

## 常見風險

- 裝置重插後 COM 編號改變
- 不同設備誤綁到錯誤 Port ID
- Port 開啟成功但 BaudRate 錯誤，造成通訊內容看似亂碼或無回應
- 腳本中的裝置名稱與實際 Port 配置不一致
