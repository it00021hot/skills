#!/usr/bin/env bash
# 校验 dev-habits 语料中的规则引用：
#   『slug』 形式的引用必须解析到唯一已定义 slug（定义集合与 check-slugs.sh 相同）。
# 这是废除全局编号后的安全网：引用按名字解析，改名会被这里抓住。
set -euo pipefail

root="dev-habits"
if [ ! -d "$root" ]; then
  echo "SKIP: 无 $root 目录"
  exit 0
fi

slugs=$(mktemp)
refs=$(mktemp)
trap 'rm -f "$slugs" "$refs"' EXIT

for f in $(find "$root" -name '*.md' | sort); do
  grep -o '\*\*\[[^]]*\]\*\*' "$f" 2>/dev/null | sed 's/^\*\*\[//; s/\]\*\*$//' >> "$slugs" || true
  grep -o '『[^』]*』' "$f" 2>/dev/null | sed 's/^『//; s/』$//' | while read -r r; do
    [ -n "$r" ] || continue
    printf '%s\t%s\n' "$r" "$f"
  done >> "$refs" || true
done

fail=0
total=0
while IFS=$'\t' read -r r f; do
  [ -n "$r" ] || continue
  total=$((total + 1))
  if ! grep -qxF "$r" "$slugs"; then
    echo "FAIL $f: 引用『${r}』无对应规则定义"
    fail=1
  fi
done < "$refs"

if [ "$fail" -eq 0 ]; then
  echo "OK: 全部『slug』引用可解析（$total 处）"
else
  exit 1
fi
