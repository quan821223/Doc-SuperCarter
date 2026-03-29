# 自動偵測

本章說明 SuperCarter 目前的設備自動偵測方式。

## 偵測來源

依目前程式實作，設備偵測主要透過 Windows 的裝置資訊完成，核心來源包括：

- `Win32_PnPEntity`
- COM Port 類別 `ClassGuid`
- Registry 中的 `PortName`

程式會先找出屬於序列埠類別的裝置，再從中整理出可用的 `COM` 端口資訊。

## 偵測流程

目前可概括為以下步驟：

1. 掃描 Windows 已枚舉的 PnP 裝置
2. 篩選出屬於 Ports 類別的裝置
3. 依 `PnPDeviceID` 判斷是否符合目前的設備篩選條件
4. 從 Registry 讀出對應的 `PortName`
5. 整理成程式內可用的裝置清單

## 偵測群組

依目前程式定義，設備偵測至少有兩種模式：

- `ALL`
- `SuperDevice`

### `ALL`

顯示所有目前可取得的 COM Port 裝置。

### `SuperDevice`

只顯示符合既定 PnP Device ID 條件的設備。  
這個模式較適合在只關心 SuperCarter 相關設備時使用。

## 動態更新

程式中有 `SerialDeviceDiscoveryService` 與 `SerialPortWatcher`，表示目前設計上支援：

- 裝置插入時更新
- 裝置移除時更新
- 重新整理目前端口清單

因此在裝置插拔後，設備列表理論上會重新同步。

## 偵測成功的條件

要讓自動偵測正常工作，通常需要同時滿足：

- 裝置已正確連接
- 驅動已安裝完成
- Windows 已建立對應 COM Port
- 裝置的 PnP Device ID 符合程式目前設定

## 可能看不到設備的原因

如果自動偵測沒有看到設備，常見原因包括：

- 裝置驅動未正確安裝
- 線材或供電異常
- 裝置未被 Windows 辨識成 COM Port
- 裝置雖存在，但不符合目前 `SuperDevice` 篩選條件
- 裝置剛插入，列表尚未重新整理

## 建議操作

- 先在 Windows 裝置管理員確認是否已出現對應 COM Port
- 若不確定篩選是否過嚴，可先用 `ALL` 模式確認設備是否存在
- 插拔設備後，建議重新檢查列表是否已更新
