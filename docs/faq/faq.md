# 常見問題

## SuperCarter 可以啟動，但部分功能不能用

請先依序確認：

- `.NET Desktop Runtime 6.0` 已安裝
- `Python 3.12` 已安裝
- 必要 Python 套件已安裝
- 裝置已連線完成
- 沒有其他程式占用相機或 COM Port

## 為什麼插了設備，程式還是看不到

常見原因包括：

- Windows 沒有正確辨識設備
- 驅動未安裝完成
- 裝置未被枚舉為 COM Port
- 目前偵測模式使用了較嚴格的設備篩選

## 為什麼設備看得到，但連不上

請優先檢查：

- COM 編號是否改變
- BaudRate 是否正確
- 裝置是否被其他程式占用
- 目前配置是否對應到正確 Port ID

## 監控腳本支援什麼格式

目前監控主流程以 JSON 腳本為主。  
另外指令序列本身也會以 XML 形式保存與匯入。

## `TestCondition` 與 `TestParameter` 有什麼不同

- `TestCondition` 偏向前置條件或條件檢查
- `TestParameter` 偏向週期性參數讀取或測試

兩者都可以掛在 Task 上，但用途不同。

## 為什麼監控沒有開始

常見原因包括：

- 尚未匯入 JSON 腳本
- 腳本路徑錯誤
- 設備數量不足
- 腳本載入失敗
- 監控在啟動前就被取消

## 為什麼有輸出資料，但結果不對

請先檢查：

- 腳本內的裝置目標是否正確
- 命令格式是 `HEX` 還是 `ASCII`
- 是否需要 `CR` / `LF` / `CRLF`
- 監控閾值與參數設定是否正確

## 記錄檔在哪裡

主要日誌位置在：

```text
%USERPROFILE%\Documents\SuperCarter\logs
```

## CSV 結果在哪裡

主要輸出位置在：

```text
%USERPROFILE%\Documents\SuperCarter\result
```

## 腳本放在哪裡

目前腳本主要放在：

```text
%USERPROFILE%\Documents\SuperCarter\scripts
```

## 為什麼同一份腳本昨天能跑，今天不能跑

常見原因包括：

- 裝置 COM 編號變了
- 實際設備連線狀態不同
- 腳本引用的子腳本或路徑被移動
- 裝置回應內容或時序改變

遇到這類問題時，通常應先比對：

- 設備連線
- 腳本版本
- Error Log
- Communication Log
