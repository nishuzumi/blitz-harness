---
name: m-start
description: 在启动 Monad 黑客松项目、初始化 Harness 状态、或进入新仓库时使用。
---
初始化 Harness。

1. 读取 `.mon-harness/state.json` 和 `docs/status.md`。
2. 检查项目本地是否已有 monskill。
3. 优先查 `.agents/skills/monskill/SKILL.md`，否则查 `npx --yes skills list --json`。
4. 已存在就不要重复安装。
5. 若缺失，直接运行：

```bash
npx --yes skills add therealharpaljadeja/monskills \
  --skill monskill \
  --agent codex \
  --copy \
  -y
```

6. 安装成功后提示：monskill 已安装到项目本地。
7. 创建或修复核心文档和进度。
8. 把 `.mon-harness/state.json` 的阶段设为 `initialized`。
9. 把 `docs/status.md` 改成“已初始化”，并记录下一步。
10. 输出下一步：
   - 没想法：`$m-scout`
   - 有想法：`$m-idea`
   - 重启后：`$m-status`

不要只解释能力。能写状态就写状态，能修文档就修文档。
不要重复安装 monskill。
不要全局安装 monskill；不要使用 `-g`。
如果安装失败，说明原因，标记 monskill 未接入，但继续完成初始化。
不要进入长访谈；初始化后只问一个问题：你现在有项目想法吗？
