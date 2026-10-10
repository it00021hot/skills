# skills

个人 agent skills，供 [Skills CLI](https://skills.sh/)（`npx skills`）安装。

## 安装

```bash
# GPUI 桌面应用 UI 设计（GPUI Kit / gpui-component）
npx skills add it00021hot/skills@gpui-ui-design -g

# Web 前端 UI 设计
npx skills add it00021hot/skills@web-ui-design -g
```

`-g` 安装到用户级（`~/.agents/skills/`），去掉 `-g` 则安装到当前项目。新机器上如需更新，重新执行同样命令即可。

## Skills

- **gpui-ui-design** — GPUI 桌面应用的界面设计、实现与审查：GPUI Kit 与 gpui-component 的屏幕、组件、布局、主题、焦点、输入、浮层、数据视图、无障碍与交互质量。附完整 Design Guides / Coding Guides（CC BY 4.0，拷贝自 [longbridge/gpui-kit](https://github.com/longbridge/gpui-kit)，署名见 `gpui-ui-design/NOTICE.md`，来源与版本见 `gpui-ui-design/SOURCES.md`）。
- **web-ui-design** — Web 界面的设计、实现与审查：站点、Web 应用、仪表盘、表单、组件、响应式布局、设计系统、无障碍与交互质量。来源记录见 `web-ui-design/SOURCES.md`。

## 许可说明

两个 skill 的正文为原创综合内容。`gpui-ui-design` 内含来自 longbridge/gpui-kit 的 CC BY 4.0 文档拷贝，按许可要求保留署名与修改说明；其余引用来源的授权情况见各 skill 目录内的 `SOURCES.md`。
