# skills

个人 agent skills，供 [Skills CLI](https://skills.sh/)（`npx skills`）安装。

## 安装

```bash
# GPUI 桌面应用 UI 设计（GPUI Kit / gpui-component）
npx skills add it00021hot/skills@gpui-ui-design -g

# Web 前端 UI 设计
npx skills add it00021hot/skills@web-ui-design -g

# 个人开发习惯与协作约定
npx skills add it00021hot/skills@dev-habits -g

# NSH 应用开发（Native Shell CLI / TSX / Rust / 嵌入）
npx skills add it00021hot/skills@nsh-app-dev -g
```

`-g` 安装到用户级（`~/.agents/skills/`），去掉 `-g` 则安装到当前项目。新机器上如需更新，重新执行同样命令即可。

## Skills

- **gpui-ui-design** — GPUI 桌面应用的界面设计、实现与审查：GPUI Kit 与 gpui-component 的屏幕、组件、布局、主题、焦点、输入、浮层、数据视图、无障碍与交互质量。附完整 Design Guides / Coding Guides（CC BY 4.0，拷贝自 [longbridge/gpui-kit](https://github.com/longbridge/gpui-kit)，署名见 `gpui-ui-design/NOTICE.md`，来源与版本见 `gpui-ui-design/SOURCES.md`）。
- **web-ui-design** — Web 界面的设计、实现与审查：站点、Web 应用、仪表盘、表单、组件、响应式布局、设计系统、无障碍与交互质量。来源记录见 `web-ui-design/SOURCES.md`。
- **dev-habits** — 个人工程宪法，跨项目生效：做事方式、代码质量硬性规则、安全与合规（不可覆盖）、测试、数据、性能并发、日志排查、跨端传输契约与交流方式；含仲裁阶梯、门禁表与可机械强制条款清单（配置模板在 `templates/`）。项目自身约定优先，安全与合规不可覆盖。
- **nsh-app-dev** — Native Shell（NSH）应用开发：`nsh` CLI 全命令（init / run / dev / check / test / build / package / publish 与签名链）、TSX 与 Rust 两种路线的写法铁律、无头测试与真平台验证、跨平台适配（iOS / Android / macOS / Windows / Linux / GPUI / web）与宿主嵌入（xcframework / aar / AppView / createPlayer），附 pitfalls 与评测场景。内容综合自 NSH checkout 的官网源文档，来源见 `nsh-app-dev/SOURCES.md`。

## 协作边界

`dev-habits` 是工程宪法，管一切项目的做事方式、代码质量、安全、测试、数据、日志与传输契约；`web-ui-design` 与 `gpui-ui-design` 是设计专业层，管界面设计、实现与审查；`nsh-app-dev` 是 NSH 技术栈专项，管 `nsh` CLI、TSX/Rust 应用写法、跨平台与宿主嵌入。多层同时触发时：界面与交互决策以设计 skill 为准，NSH 技术栈问题以 `nsh-app-dev` 为准，代码质量、类型与传输契约以 `dev-habits` 为准；冲突按 `dev-habits` 的仲裁阶梯裁决（dev-habits/SKILL.md）。

## 自检

```bash
bash scripts/check-all.sh
```

校验各 SKILL.md 的 frontmatter、dev-habits 的规则 slug 唯一性与引用可解析、门禁登记与链接完整、模板配置存在性。CI（`.github/workflows/check-skills.yml`）跑同一入口。

## 许可说明

两个设计 skill 的正文为原创综合内容。`gpui-ui-design` 内含来自 longbridge/gpui-kit 的 CC BY 4.0 文档拷贝，按许可要求保留署名与修改说明；`nsh-app-dev` 综合自 NSH 仓库自带文档（其官网源），来源与同步方式见 `nsh-app-dev/SOURCES.md`；其余引用来源的授权情况见各 skill 目录内的 `SOURCES.md`。
