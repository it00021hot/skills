# templates

dev-habits 机械条款的强制配置模板。机制：条款只写进 skill 文本解决"知道"，lint 与 clippy 配置才解决"做到"。

## 用法

1. 把对应栈的配置拷进项目根目录，按项目实际微调；放宽必须在注释里写明为什么（对齐 SKILL.md『单一路线』的例外声明风格）。
2. 工具版本锁定（go.mod tools、Cargo.toml、package.json devDependencies 或单独工具清单），不随 CI 静默升级。
3. 报错清零再交付，见 SKILL.md『工具链报错清零』。

## 覆盖条款与配置映射

| 栈 | 文件 | 覆盖条款 |
| --- | --- | --- |
| Go | `.golangci.yml` | 『工具链报错清零』（gofumpt）、『错误处理按项目约定』（errcheck）、『查询参数化』『外部输入不可信』（gosec）、『注释写为什么』（revive）、『函数只做一件事』（funlen、gocognit）、『嵌套限深』（nestif）、『调试残留清零』Go 侧（forbidigo）、『禁魔法值』（mnd） |
| Rust | `lints.toml`（并入 Cargo.toml）、`clippy.toml`、`rustfmt.toml` | 『错误处理按项目约定』（unwrap_used、expect_used、panic deny）、『调试残留清零』（print_stdout、dbg_macro deny）、『工具链报错清零』（rustfmt）、『函数只做一件事』（too_many_lines）、『参数收敛』（too_many_arguments 加 clippy.toml 阈值） |
| TS | `eslint.config.mjs` | 『前端禁 any』（no-explicit-any 与 no-unsafe-* 系列，type-aware）、『零冗余』（no-unused-vars，随 recommendedTypeChecked 自带）、『调试残留清零』（no-console 放行 warn/error）、『函数只做一件事』『嵌套限深』『参数收敛』（max-lines-per-function、complexity、max-depth、max-params，warn 提醒档） |

无通用 lint 的条款（『整型 ID 字符串化』『传输字段 camelCase』）靠边界 schema 校验兜底，见 `../dev-habits/references/api-contract.md`『契约两端同源』；『禁魔法值』的 Rust、TS 侧与『可变不外泄』、『依赖无环』TS 侧为已登记缺口，靠审查兜底（SKILL.md 机械条款表「已知缺口」行）。

本目录的文件存在性由 `scripts/checks/check-links.sh` 钉死：SKILL.md 机械条款表里登记的配置路径若缺失，CI 直接失败。
