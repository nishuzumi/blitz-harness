# MOJO skills

给参赛者的 Agent（Claude Code、Codex 等）用的 MOJO 平台技能，一共三个：

| skill | 做什么 |
| --- | --- |
| `mojo` | 入口：找凭证、读接口说明、查活动信息和截止时间 |
| `mojo-mentor` | 让创意导师判断创意值不值得做、会不会和往届项目撞车 |
| `mojo-submit` | 把项目提交或更新到 MOJO |

三个 skill 只是薄壳：接口用法每个会话从 MOJO 的 `/api/agent/skills/mojo` 现读，MOJO 接口改了不用发新版。
`mojo-mentor` 和 `mojo-submit` 依赖 `mojo`，三个要一起装。

## 安装

一般不用手动装：MOJO 活动页「For Agent」里的参赛引导会带 Agent 装好，并完成注册和认领。

手动安装（在项目根目录，项目级）：

```text
npx --yes skills add nishuzumi/blitz-harness --skill mojo mojo-mentor mojo-submit --agent claude-code codex -y
```

更新到最新版：

```text
npx --yes skills update -p -y
```

## 维护

- 改完跑 `bash scripts/check-skills.sh`：用真正的安装器确认每个 SKILL.md 都能被识别。frontmatter 写错时安装器只警告、跳过，不会报错。CI 同跑。
- frontmatter 只写 `name` 和 `description`，`name` 必须和目录名一致。
- 接口细节写在 MOJO 仓库（`src/lib/agent-instructions.ts`），这里只写流程和边界，不要抄接口。
