# 阶段

```text
empty
  ↓ $m-start
initialized
  ↓ $m-scout 或 $m-idea
idea-ready
  ↓ $m-grill
idea-locked
  ↓ $m-build
build-planned
  ↓ monskill
demo-ready
  ↓ $m-submit
submission-ready
  ↓ $m-pitch
pitch-ready
```

`$m-status` 可在任何阶段恢复。

智能体每次任务后主动提醒风险和下一步。
