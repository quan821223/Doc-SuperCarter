# 問題回報

如果你在使用 SuperCarter 時遇到錯誤、文件不清楚，或有功能建議，可以依照你的使用情境選擇下列回報方式。

## 回報入口

### 1. 使用 GitHub 回報

適合已有 GitHub 帳號的使用者。

[前往 GitHub Issues](https://github.com/quan821223/SuperCarter/issues){ .md-button .md-button--primary target="_blank" rel="noopener" }
[建立新 Issue](https://github.com/quan821223/SuperCarter/issues/new){ .md-button target="_blank" rel="noopener" }

### 2. 使用 Email 回報

適合沒有 GitHub 帳號，或希望直接寄信回報的使用者。

先填下列表單，再按 `開啟郵件程式` 或 `複製回報內容`。

<div class="email-report-tool" style="border:1px solid var(--md-default-fg-color--lightest); border-radius:12px; padding:1rem; margin:1rem 0;">
  <p><strong>收件人：</strong> <code>chon821223@gmail.com</code></p>
  <p><strong>固定主旨：</strong> <code>[SuperCarter][Issue] 請填寫問題摘要</code></p>
  <div style="display:grid; gap:0.75rem; grid-template-columns:repeat(auto-fit, minmax(220px, 1fr));">
    <label>問題類型
      <select id="issue-type" style="width:100%; padding:0.5rem;">
        <option>Bug</option>
        <option>文件問題</option>
        <option>功能建議</option>
        <option>其他</option>
      </select>
    </label>
    <label>使用版本
      <input id="issue-version" type="text" placeholder="例如：v1.11.2" style="width:100%; padding:0.5rem;">
    </label>
    <label>作業系統與環境
      <input id="issue-env" type="text" placeholder="例如：Windows 11 / 設備型號" style="width:100%; padding:0.5rem;">
    </label>
    <label>問題摘要
      <input id="issue-summary" type="text" placeholder="請簡述問題" style="width:100%; padding:0.5rem;">
    </label>
  </div>
  <div style="display:grid; gap:0.75rem; margin-top:0.75rem;">
    <label>問題描述
      <textarea id="issue-description" rows="4" style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>重現步驟
      <textarea id="issue-steps" rows="4" placeholder="1. ...&#10;2. ...&#10;3. ..." style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>預期結果
      <textarea id="issue-expected" rows="3" style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>實際結果
      <textarea id="issue-actual" rows="3" style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>錯誤訊息
      <textarea id="issue-error" rows="3" style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>附件說明
      <textarea id="issue-attachments" rows="3" placeholder="如有截圖、log 或影片，請說明附件內容。" style="width:100%; padding:0.5rem;"></textarea>
    </label>
    <label>回報內容預覽
      <textarea id="issue-preview" rows="16" readonly style="width:100%; padding:0.5rem;"></textarea>
    </label>
  </div>
  <div style="display:flex; gap:0.75rem; flex-wrap:wrap; margin-top:0.75rem;">
    <button id="issue-compose" type="button" class="md-button md-button--primary">開啟郵件程式</button>
    <button id="issue-copy" type="button" class="md-button">複製回報內容</button>
  </div>
  <p id="issue-feedback" style="margin-top:0.75rem;"></p>
</div>

如果點擊 `開啟郵件程式` 沒有反應，請改用 `複製回報內容`，再手動寄信到 `chon821223@gmail.com`。

## Email 回報模板

如果 `Email 回報` 按鈕無法自動開啟郵件程式，可直接複製以下內容寄送：

```text
收件人：chon821223@gmail.com
主旨：[SuperCarter][Issue] 請填寫問題摘要

1. 問題類型
Bug / 文件問題 / 功能建議 / 其他

2. 使用版本
例如：v1.11.2

3. 作業系統與環境
例如：Windows 11 / 設備型號

4. 問題描述

5. 重現步驟
1.
2.
3.

6. 預期結果

7. 實際結果

8. 錯誤訊息

9. 附件說明
如有截圖、log 或影片，請一併附上。
```

<script>
(() => {
  const subjectPrefix = "[SuperCarter][Issue]";
  const email = "chon821223@gmail.com";
  const ids = {
    type: "issue-type",
    version: "issue-version",
    env: "issue-env",
    summary: "issue-summary",
    description: "issue-description",
    steps: "issue-steps",
    expected: "issue-expected",
    actual: "issue-actual",
    error: "issue-error",
    attachments: "issue-attachments",
    preview: "issue-preview",
    feedback: "issue-feedback",
    compose: "issue-compose",
    copy: "issue-copy"
  };

  const get = (key) => document.getElementById(ids[key]);
  const text = (key) => get(key).value.trim();

  function buildBody() {
    return [
      "1. 問題類型",
      text("type"),
      "",
      "2. 使用版本",
      text("version"),
      "",
      "3. 作業系統與環境",
      text("env"),
      "",
      "4. 問題描述",
      text("description"),
      "",
      "5. 重現步驟",
      text("steps"),
      "",
      "6. 預期結果",
      text("expected"),
      "",
      "7. 實際結果",
      text("actual"),
      "",
      "8. 錯誤訊息",
      text("error"),
      "",
      "9. 附件說明",
      text("attachments")
    ].join("\n");
  }

  function buildSubject() {
    const summary = text("summary") || "請填寫問題摘要";
    return `${subjectPrefix} ${summary}`;
  }

  function refreshPreview() {
    get("preview").value = `收件人：${email}\n主旨：${buildSubject()}\n\n${buildBody()}`;
    get("feedback").textContent = "";
  }

  function allInputs() {
    return ["type", "version", "env", "summary", "description", "steps", "expected", "actual", "error", "attachments"];
  }

  allInputs().forEach((key) => {
    get(key).addEventListener("input", refreshPreview);
    get(key).addEventListener("change", refreshPreview);
  });

  get("compose").addEventListener("click", () => {
    const href = `mailto:${email}?subject=${encodeURIComponent(buildSubject())}&body=${encodeURIComponent(buildBody())}`;
    window.location.href = href;
    get("feedback").textContent = "已嘗試開啟郵件程式。若沒有反應，請改用「複製回報內容」。";
  });

  get("copy").addEventListener("click", async () => {
    const content = get("preview").value;
    try {
      await navigator.clipboard.writeText(content);
      get("feedback").textContent = "回報內容已複製，可直接貼到 email。";
    } catch (err) {
      get("preview").focus();
      get("preview").select();
      get("feedback").textContent = "無法自動複製，已幫你選取內容，請手動複製。";
    }
  });

  refreshPreview();
})();
</script>

!!! info "建議回報內容"
    為了讓問題更容易重現與排查，建議在 issue 或 email 內附上以下資訊：

    - 使用的版本號
    - 作業系統與環境
    - 問題發生步驟
    - 預期結果
    - 實際結果
    - 錯誤訊息、截圖或 log

## 回報類型

### 程式異常或 Bug

適合回報：

- 功能無法使用
- 操作後出現錯誤訊息
- 輸出結果異常
- 文件描述與實際行為不一致

### 功能建議

適合回報：

- 希望新增功能
- 希望調整 UI 或操作流程
- 希望補充或改善文件內容

## 開單前可先確認

- 是否已經在現有 issue 中有人回報過類似問題
- 是否能穩定重現
- 是否能提供最小重現步驟

## 相關連結

- [瀏覽所有 Issues](https://github.com/onv-rgmda0/Tool-SuperCarter/issues)
- [建立新 Issue](https://github.com/onv-rgmda0/Tool-SuperCarter/issues/new)
- [寄送 Email 回報](mailto:chon821223@gmail.com?subject=%5BSuperCarter%5D%5BIssue%5D%20%E8%AB%8B%E5%A1%AB%E5%AF%AB%E5%95%8F%E9%A1%8C%E6%91%98%E8%A6%81&body=1.%20%E5%95%8F%E9%A1%8C%E9%A1%9E%E5%9E%8B%0ABug%20%2F%20%E6%96%87%E4%BB%B6%E5%95%8F%E9%A1%8C%20%2F%20%E5%8A%9F%E8%83%BD%E5%BB%BA%E8%AD%B0%20%2F%20%E5%85%B6%E4%BB%96%0A%0A2.%20%E4%BD%BF%E7%94%A8%E7%89%88%E6%9C%AC%0A%E4%BE%8B%E5%A6%82%EF%BC%9Av1.11.2%0A%0A3.%20%E4%BD%9C%E6%A5%AD%E7%B3%BB%E7%B5%B1%E8%88%87%E7%92%B0%E5%A2%83%0A%E4%BE%8B%E5%A6%82%EF%BC%9AWindows%2011%20%2F%20%E8%A8%AD%E5%82%99%E5%9E%8B%E8%99%9F%0A%0A4.%20%E5%95%8F%E9%A1%8C%E6%8F%8F%E8%BF%B0%0A%0A5.%20%E9%87%8D%E7%8F%BE%E6%AD%A5%E9%A9%9F%0A1.%20%0A2.%20%0A3.%20%0A%0A6.%20%E9%A0%90%E6%9C%9F%E7%B5%90%E6%9E%9C%0A%0A7.%20%E5%AF%A6%E9%9A%9B%E7%B5%90%E6%9E%9C%0A%0A8.%20%E9%8C%AF%E8%AA%A4%E8%A8%8A%E6%81%AF%0A%0A9.%20%E9%99%84%E4%BB%B6%E8%AA%AA%E6%98%8E%0A%E5%A6%82%E6%9C%89%E6%88%AA%E5%9C%96%E3%80%81log%20%E6%88%96%E5%BD%B1%E7%89%87%EF%BC%8C%E8%AB%8B%E4%B8%80%E4%BD%B5%E9%99%84%E4%B8%8A%E3%80%82)
