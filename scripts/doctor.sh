#!/usr/bin/env bash
set -euo pipefail

missing=0
for f in README.md AGENTS.md .mon-harness/state.json .mon-harness/progress.json docs/status.md .agents/skills/m-router/SKILL.md; do
  [ -f "$f" ] || { echo "缺少 $f"; missing=1; }
done

grep -q '主动提醒' AGENTS.md || { echo "缺少主动提醒规则"; missing=1; }
grep -q '无需安装' README.md || { echo "缺少本地模式说明"; missing=1; }
grep -q '## 主流程：想法 → 提交' .agents/skills/m-router/SKILL.md || { echo "路由器缺少主流程"; missing=1; }
grep -q '### 上下文卫生' .agents/skills/m-router/SKILL.md || { echo "路由器缺少上下文卫生"; missing=1; }
grep -q '## 入口' .agents/skills/m-router/SKILL.md || { echo "路由器缺少入口"; missing=1; }
grep -q '## 构建健康' .agents/skills/m-router/SKILL.md || { echo "路由器缺少构建健康"; missing=1; }
grep -q '## 跨会话' .agents/skills/m-router/SKILL.md || { echo "路由器缺少跨会话"; missing=1; }
grep -q '## 独立事项' .agents/skills/m-router/SKILL.md || { echo "路由器缺少独立事项"; missing=1; }
grep -q '## 前置条件' .agents/skills/m-router/SKILL.md || { echo "路由器缺少前置条件"; missing=1; }
grep -q '未初始化必须先执行' .agents/skills/m-router/SKILL.md || { echo "路由器缺少自动初始化规则"; missing=1; }
grep -q '不要只解释能力' .agents/skills/m-start/SKILL.md || { echo "启动技能缺少执行约束"; missing=1; }
grep -q 'stage.*empty.*m-start' AGENTS.md || { echo "智能体规则缺少空状态启动"; missing=1; }

bad_skill=0
for s in .agents/skills/*/SKILL.md; do
  [ "$(sed -n '1p' "$s")" = "---" ] || { echo "$s 第 1 行错误"; bad_skill=1; }
  sed -n '2p' "$s" | grep -q '^name: ' || { echo "$s 缺少名称"; bad_skill=1; }
  sed -n '3p' "$s" | grep -q '^description: 在' || { echo "$s 描述不是中文触发语"; bad_skill=1; }
  [ "$(sed -n '4p' "$s")" = "---" ] || { echo "$s 第 4 行错误"; bad_skill=1; }
  sed -n '3p' "$s" | grep -q '用户输入' && { echo "$s 仍然依赖显式触发"; bad_skill=1; }
done

[ "$missing$bad_skill" = "00" ] || exit 1
echo "通过"
