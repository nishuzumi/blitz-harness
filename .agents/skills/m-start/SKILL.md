---
name: m-start
description: 在启动 Monad 黑客松项目、初始化 Harness 状态、或进入新仓库时使用。
---
初始化 Harness。

1. 读取 `.mon-harness/state.json` 和 `docs/status.md`。
2. 检查 monskill 是否可用；不可用就提示先装。
3. 创建或修复核心文档和进度。
4. 把 `.mon-harness/state.json` 的阶段设为 `initialized`。
5. 把 `docs/status.md` 改成“已初始化”，并记录下一步。
6. 输出下一步：
   - 没想法：`$m-scout`
   - 有想法：`$m-idea`
   - 重启后：`$m-status`

不要只解释能力。能写状态就写状态，能修文档就修文档。
不要进入长访谈；初始化后只问一个问题：你现在有项目想法吗？
