#!/usr/bin/env bash
# 校验所有 */SKILL.md 的 frontmatter：
#   1. frontmatter 存在且闭合
#   2. name 与所在目录名一致
#   3. description 存在、单行、不含 ": "（plain scalar 会被 YAML 截断）、不含 < 和 >、不超过 1024 字符
set -euo pipefail

fail=0

for skill_md in */SKILL.md; do
  [ -e "$skill_md" ] || continue
  dir=$(basename "$(dirname "$skill_md")")

  if ! head -n 1 "$skill_md" | grep -q '^---$'; then
    echo "FAIL $skill_md: 缺少 frontmatter"
    fail=1
    continue
  fi

  fm_end=$(awk 'NR>1 && /^---$/{print NR; exit}' "$skill_md")
  if [ -z "$fm_end" ]; then
    echo "FAIL $skill_md: frontmatter 未闭合"
    fail=1
    continue
  fi

  fm=$(sed -n "2,$((fm_end - 1))p" "$skill_md")
  name=$(printf '%s\n' "$fm" | sed -n 's/^name: *//p')
  desc=$(printf '%s\n' "$fm" | sed -n 's/^description: *//p')
  desc_lines=$(printf '%s\n' "$fm" | grep -c '^description:' || true)

  if [ "$name" != "$dir" ]; then
    echo "FAIL $skill_md: name（$name）与目录名（$dir）不一致"
    fail=1
  fi

  if [ -z "$desc" ]; then
    echo "FAIL $skill_md: 缺少 description"
    fail=1
  else
    if [ "$desc_lines" -ne 1 ]; then
      echo "FAIL $skill_md: description 必须单行（当前 $desc_lines 行）"
      fail=1
    fi
    case "$desc" in
      *': '*) echo "FAIL $skill_md: description 含 ': '，plain scalar 会被 YAML 截断"; fail=1 ;;
    esac
    case "$desc" in
      *'<'*|*'>'*) echo "FAIL $skill_md: description 含 < 或 >"; fail=1 ;;
    esac
    len=${#desc}
    if [ "$len" -gt 1024 ]; then
      echo "FAIL $skill_md: description 超过 1024 字符（当前 $len）"
      fail=1
    fi
  fi
done

if [ "$fail" -eq 0 ]; then
  echo "OK: 全部 SKILL.md frontmatter 校验通过"
else
  exit 1
fi
