#!/usr/bin/env bash
# skills 仓库自检入口：依次执行 checks/ 下全部检查，任一失败则整体失败。
# 本地与 CI 共用同一入口（.github/workflows/check-skills.yml）。
set -euo pipefail

cd "$(dirname "$0")/.."

fail=0
for check in scripts/checks/*.sh; do
  echo "== $check"
  if bash "$check"; then
    continue
  else
    echo "== $check 失败"
    fail=1
  fi
done

if [ "$fail" -eq 0 ]; then
  echo "OK: 全部检查通过"
else
  echo "FAIL: 存在失败项"
  exit 1
fi
