# 维护规则

本仓库发布 MOJO 的三个 Agent skill（见 README）。改动时：

- 用中文。
- skill 只写流程和边界。接口路径、字段、错误码以 MOJO 的 `/api/agent/skills/mojo` 为准，不要抄进来，否则 MOJO 改接口后这里会过期。
- `mojo-mentor`、`mojo-submit` 引用 `mojo` 的步骤，不复制凭证和安全规则。
- 每个 SKILL.md 的 frontmatter 只有 `name`、`description`，`name` 与目录名一致。
- 提交前跑 `bash scripts/check-skills.sh`。
