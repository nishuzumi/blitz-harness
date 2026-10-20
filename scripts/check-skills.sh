#!/usr/bin/env bash
# 用真正的安装器检查每个 SKILL.md 都能被识别。
# frontmatter 写错时 `skills` 只打一条警告就跳过（monskills 的 wallet 就是这样漏掉的），退出码仍是 0，
# 所以这里比对「仓库里的 SKILL.md 数」和「安装器找到的 skill 数」。
set -euo pipefail
cd "$(dirname "$0")/.."

bad=0
expected=0
for s in .agents/skills/*/SKILL.md; do
  expected=$((expected + 1))
  dir=$(basename "$(dirname "$s")")
  name=$(sed -n '2p' "$s" | sed 's/^name: //')
  [ "$name" = "$dir" ] || { echo "$s 的 name 是「$name」，应与目录名「$dir」一致"; bad=1; }
done

output=$(npx --yes skills add . --list 2>&1 || true)
found=$(printf '%s\n' "$output" | sed -n 's/.*Found \([0-9][0-9]*\) skills\{0,1\}.*/\1/p' | head -1)

if [ "${found:-0}" != "$expected" ]; then
  printf '%s\n' "$output"
  echo "安装器只识别出 ${found:-0} 个 skill，仓库里有 $expected 个 SKILL.md"
  bad=1
fi

[ "$bad" = 0 ] || exit 1
echo "通过：$expected 个 skill 都能被安装器识别"
