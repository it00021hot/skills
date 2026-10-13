#!/usr/bin/env bash
# 校验 dev-habits 的路径完整性：
#   1. markdown 相对链接（[text](path)）指向的文件存在
#   2. references/ 下每个文件都在 SKILL.md 门禁表中登记（无孤儿文件）
#   3. 正文提到的 templates/ 配置路径在仓库中存在（机械条款有配置兜底）
set -euo pipefail

root="dev-habits"
if [ ! -d "$root" ]; then
  echo "SKIP: 无 $root 目录"
  exit 0
fi

fail=0

# 1. markdown 相对链接
for f in $(find "$root" -name '*.md' | sort); do
  dir=$(dirname "$f")
  links=$(grep -o ']([^)]*)' "$f" 2>/dev/null | sed 's/^](//; s/)$//' || true)
  [ -n "$links" ] || continue
  printf '%s\n' "$links" | while read -r t; do
    case "$t" in
      http*|\#*|"") continue ;;
    esac
    if [ ! -e "$dir/$t" ]; then
      echo "FAIL $f: 链接目标不存在 -> $t"
      exit 1
    fi
  done || fail=1
done

# 2. references 无孤儿
for ref in "$root"/references/*.md; do
  [ -e "$ref" ] || continue
  base=$(basename "$ref")
  if ! grep -q "$base" "$root/SKILL.md"; then
    echo "FAIL $ref: 未在 SKILL.md 门禁表中登记（孤儿文件）"
    fail=1
  fi
done

# 3. templates 配置存在
for f in $(find "$root" -name '*.md' | sort); do
  paths=$(grep -o 'templates/[A-Za-z0-9_./-]*' "$f" 2>/dev/null || true)
  [ -n "$paths" ] || continue
  printf '%s\n' "$paths" | while read -r p; do
    [ -n "$p" ] || continue
    if [ ! -e "$p" ]; then
      echo "FAIL $f: 模板配置不存在 -> $p"
      exit 1
    fi
  done || fail=1
done

if [ "$fail" -eq 0 ]; then
  echo "OK: 链接、门禁登记与模板配置路径完整"
else
  exit 1
fi
