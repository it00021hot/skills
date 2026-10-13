#!/usr/bin/env bash
# 校验 dev-habits 语料的规则 slug：
#   1. slug 定义形式统一为 "- **[slug]**"
#   2. slug 全库唯一（SKILL.md 与 references/*.md 合计）
# 约定：『slug』是规则引用的唯一形式，由 check-references.sh 校验可解析；
#       『』不得挪作普通引号使用（普通引号用「」）。
set -euo pipefail

root="dev-habits"
if [ ! -d "$root" ]; then
  echo "SKIP: 无 $root 目录"
  exit 0
fi

slugs=$(mktemp)
trap 'rm -f "$slugs"' EXIT

for f in $(find "$root" -name '*.md' | sort); do
  grep -o '\*\*\[[^]]*\]\*\*' "$f" 2>/dev/null | sed 's/^\*\*\[//; s/\]\*\*$//' | while read -r slug; do
    [ -n "$slug" ] || continue
    printf '%s\t%s\n' "$slug" "$f"
  done >> "$slugs"
done

total=$(wc -l < "$slugs" | tr -d ' ')
dups=$(cut -f1 "$slugs" | sort | uniq -d || true)

if [ -n "$dups" ]; then
  echo "FAIL: slug 重复定义"
  printf '%s\n' "$dups" | while read -r s; do
    [ -n "$s" ] || continue
    echo "  [$s]"
    awk -F'\t' -v s="$s" '$1 == s { print "    " $2 }' "$slugs"
  done
  exit 1
fi

echo "OK: slug 定义形式与唯一性通过（$total 条）"
