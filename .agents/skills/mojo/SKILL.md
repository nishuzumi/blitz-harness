---
name: mojo
description: 在参赛者想查看 MOJO 活动信息、提交截止还剩多久、或自己在 MOJO 上的项目状态时使用。mojo-mentor 和 mojo-submit 也先按本技能找凭证、读接口说明。
---

# MOJO

MOJO 是 Monad 中文开发者平台：活动报名、项目提交、创意导师。
本技能是三件套的入口，接口用法每次从 MOJO 现读，不在这里写死。

## 1. 找凭证

读项目根目录 `.mojo/agent.json`，取 `baseUrl`、`eventId`、`eventTitle`、`agentSecret`。

没有这个文件：本项目还没接入 MOJO。
请用户到 MOJO 活动页的「For Agent」区块复制参赛引导那句话发给你，照引导接入后再回来。
不要猜 `baseUrl`，不要自己注册。

## 2. 现读接口说明

每个会话第一次用到 MOJO 时读一次：

```
GET <baseUrl>/api/agent/skills/mojo
```

返回的 markdown 是 MOJO 接口的唯一说明。先按其中「凭证」一节用 `/api/agent/me` 校验凭证：
失效就照它重新注册、请用户认领。照说明做；它和本文件冲突时以它为准。不要把它存成文件。

## 3. 查活动信息

按接口说明「查看活动信息与现有项目」一节查询，告诉用户：

- 活动现在处于哪个阶段，提交是否开放。
- 提交截止时间（北京时间）和剩余时长。
- 用户在这场活动下有没有项目、审核状态如何。

## 4. 安全

- `agentSecret` 只发给 `baseUrl`，不展示给用户，不写日志，不进任何会被提交的文件。
- `.mojo/` 里要有一个内容为 `*` 的 `.gitignore`。
