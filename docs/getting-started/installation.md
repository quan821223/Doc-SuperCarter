# 安裝

本章說明 SuperCarter 在 Windows 上的安裝需求，包含執行所需的 Python 環境與套件安裝流程。

## 前置需求

- Windows 10 或 Windows 11
- .NET Desktop Runtime 6.0
- Python 3.12
- 相機設備驅動與可用的 USB / 內建攝影機

## 必要安裝項目

### 1. 安裝 SuperCarter 執行所需的 .NET Runtime

SuperCarter 專案目前目標框架為 `net6.0-windows`，請安裝 **.NET Desktop Runtime 6.0**。

- 官方下載頁面：https://dotnet.microsoft.com/download/dotnet/6.0
- 若電腦是一般 64 位元 Windows，請優先安裝 `Desktop Runtime 6.0` 的 `x64` 版本

安裝完成後，可在 PowerShell 確認：

```powershell
dotnet --list-runtimes
```

### 2. 安裝 Python 3.12

SuperCarter 的 Python 功能依賴 Python 執行環境，建議安裝 Python 3.12。

- 可直接從 **Microsoft Store** 安裝 Python 3.12
- 若無法使用 Microsoft Store，再改用官方下載頁面：https://www.python.org/downloads/windows/
- 若使用官方安裝程式，安裝時建議勾選 `Add python.exe to PATH`

安裝完成後，可在 PowerShell 確認：

```powershell
py -3.12 --version
python --version
```

## Python 環境與套件安裝

依目前程式內容，至少需要以下套件：

- `opencv-python`
- `grpcio`
- `grpcio-tools`
- `protobuf`

### 安裝必要套件

```powershell
py -3.12 -m pip install --upgrade pip
py -3.12 -m pip install opencv-python grpcio grpcio-tools protobuf
```

若電腦上無法使用 `py`，可改用：

```powershell
python -m pip install --upgrade pip
python -m pip install opencv-python grpcio grpcio-tools protobuf
```

## 啟動與檢查

### 啟動 SuperCarter

完成上述安裝後，再依專案提供的方式啟動 SuperCarter，並確認：

1. 主程式可以正常開啟
2. Python 相依套件可正常載入
3. 相機預覽畫面可正常顯示
4. 沒有出現缺少 Python 套件或 .NET Runtime 的錯誤訊息

## 常見問題

### 找不到 `python` 或 `py`

- 重新安裝 Python，並確認已勾選 `Add python.exe to PATH`
- 重新開啟 PowerShell 後再試一次

### 啟動時出現 `No module named cv2` 或 `grpc`

- 重新執行：

```powershell
py -3.12 -m pip install opencv-python grpcio grpcio-tools protobuf
```

### SuperCarter 可啟動，但相機功能無法使用

- 確認 Windows 裝置管理員可看到相機
- 確認相機未被其他程式占用
- 確認 Python 套件已依上述步驟完成安裝
