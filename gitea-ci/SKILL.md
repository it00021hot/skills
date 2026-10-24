---
name: gitea-ci
description: Gitea Actions 流水线查询与排障——查 run 状态、失败原因、job/step 结论、拉取任务日志、发版后验证部署是否真落地。涉及 Gitea CI、流水线失败、部署排障、run 日志、Gitea API token 生成时使用；配 gitea-ci CLI 三条命令定位问题，无需登 Web UI 或查数据库。
---

# Gitea Actions 流水线查询与排障

## 0. 配置（三个环境变量，无硬编码站点信息）

| 变量 | 说明 | 示例 |
|------|------|------|
| `GITEA_API_BASE` | API 根地址（必填） | `https://gitea.example.com/api/v1` |
| `GITEA_TOKEN_FILE` | token 文件路径（默认 `~/.gitea-token`，权限 600） | `~/.gitea-token` |
| `GITEA_ORG` | 默认 owner（repo 参数不含 `/` 时使用） | `my-org` |

token 是机密：不入仓、不入 skill、不提交，只存本机文件（`chmod 600`）。

## 1. 快查 CLI：`gitea-ci`

本目录 `scripts/gitea-ci`，安装：`cp scripts/gitea-ci /usr/local/bin/ && chmod +x /usr/local/bin/gitea-ci`。

```bash
gitea-ci list my-repo 5     # 最近 runs：run_id / #编号 / 状态 / 分支 / 工作流 / 时间 / 标题
gitea-ci fail               # 只看失败的（尾部提示下一步）
gitea-ci jobs <run_id> my-repo   # 某 run 的 job 与每个 step 的成败（定位挂在哪一步）
gitea-ci log  <job_id> my-repo   # 某 job 完整明文日志（text/plain，直接输出）
```

repo 参数可写裸名（配合 `GITEA_ORG`）或完整 `owner/repo`。

典型排障会话：`fail` 拿 run_id → `jobs` 看 step 结论 → `log` 看报错输出。全程 3 条命令，约 5 秒，不登 Web UI、不查数据库。

## 2. 裸 API（脚本化 / CLI 缺失时）

- Header：`Authorization: token $(cat "$GITEA_TOKEN_FILE")`
- **私有仓匿名一律 404**（Gitea 防探测），别误判成路径错误；带 token 即通。
- 端点链（三步）：
  1. `GET /api/v1/repos/{owner}/{repo}/actions/tasks?limit=N` → run 列表；**真正的 run_id 在 `url` 字段里**（`.../actions/runs/705`）
  2. `GET /api/v1/repos/{owner}/{repo}/actions/runs/{run_id}/jobs` → job 列表：`id`、`conclusion`、每 step 的 `conclusion`
  3. `GET /api/v1/repos/{owner}/{repo}/actions/jobs/{job_id}/logs` → **明文** UTF-8 日志（不是 zstd）
- **id 语义陷阱**：logs 端点的 `{job_id}` 是数据库 `action_run_job` 主键（jobs 端点返回的 `id`），**不是** tasks 列表返回的 task id；拿错会 404。

## 3. Token 管理

生成（Gitea 服务器上容器内 CLI，无需登 Web UI；`--raw` 只输出 token 本体；子命令名随版本可能是 `generate-access-token` 或 `generate-token`，`-h` 确认）：

```bash
ssh <gitea主机> 'docker exec -u git <gitea容器> gitea admin user generate-access-token \
  -u <用户名> -t <token名带日期> --raw --scopes read:repository' > ~/.gitea-token
chmod 600 ~/.gitea-token
```

- 吊销/重生成：Web UI 用户设置 → 应用 → 删除对应 token，再按上命令生成；token 名不可重复，重签请换名字（带日期）。
- **新机器**：不要拷 token 文件——新机器能排障就必然能 SSH 到 Gitea 主机，直接重签一个（30 秒，各机器独立可吊销）。实在要拷：`scp` 后 `chmod 600`，代价是共用 token，一处泄漏两处同废。
- 排障只需读权限，`read:repository` 足够；不要图省事签 `all`。

## 4. DB 备选路径（API 不可用时）

Gitea Actions 状态真值在其数据库（以 PostgreSQL 容器为例）：

```bash
ssh <gitea主机> "docker exec <pg容器> psql -U gitea -d gitea -t -A -c \
  'SELECT id,status,workflow_id FROM action_run ORDER BY id DESC LIMIT 6'"
```

- `action_run.status`：**1=成功 2=失败**。
- job 是否真跑过看 `action_run_job` 的 `started/stopped`：均非空且 status=2 → 已失败（不是运行中）。
- 本机 runner 日志（act_runner）通常只有 "task started"，**不记成败**，别从这判断。
- 老任务日志文件：`action_task` 表拿 `log_filename`（如 `org/repo/8d/653.log.zst`），在 gitea 容器内 `/data/gitea/actions_log/<...>`，`docker exec <gitea容器> cat … | zstd -dc` 解压；新任务直接走 §2 的 log 端点。

## 5. 通用坑（实战踩过，先对照再排查）

1. 失败在几十秒内、`jobs` 显示编译/部署类 step 全 skipped → 挂在**前置门禁 step**（checkout / 工具链检查 / 配置校验），不是编译问题；先本地复现该 step 的解析逻辑定位。
2. 门禁类 step 常按**字面关键词匹配**（如配置表某列必须含特定字样），措辞不带该词就早退——改措辞前先读校验脚本，改完保持真实语义。
3. **重触发 tag 流水线**：`git tag -f <tag> && git push -f origin <tag>`（tag 移动即触发）；tag 无内容变化时强推不生效，需先删再推：`git push origin :refs/tags/<tag> && git push origin <tag>`。
4. **runner 走 fnm 时**：PATH 跟随 `~/.local/share/fnm/aliases/default/bin`（别名指针），fnm 切换 node 默认版本后，旧版本里的全局包（如 pnpm）掉出 PATH，流水线数秒失败报「缺少命令」；修复=在新版本目录里 `npm install -g pnpm`，无需重启 runner。
5. 流水线日志的执行时间戳是 UTC（带 Z 后缀），与本地时间差 8 小时（东八区），对时间线时注意换算。

## 6. 发版落地验证（流水线成功 ≠ 部署成功）

```bash
ssh <部署机> "stat -c '%y %n' <产物路径...>; systemctl show <服务> -p ActiveState,SubState,ExecMainStartTimestamp"
ssh <部署机> "journalctl -u <服务> -n 5 --no-pager"
curl -s -o /dev/null -w "HTTP %{http_code}\n" https://<站点域名>/
```

以产物 mtime + 服务重启时间 + 探活为准；涉及 DB 变更的发版，另按项目自身的 SQL 登记表核验执行状态。
