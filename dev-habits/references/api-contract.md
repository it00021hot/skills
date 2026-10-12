# 跨端传输约定（API / IPC 契约）

本文件是 dev-habits skill 的第 42–56 条，条目编号沿用其全局编号；文中引用的其它条号（如第 18 条）在 SKILL.md。项目自身约定优先；本文件是默认路线，不是可选项。

42. 传输字段（JSON key、query 参数、事件 payload）一律 camelCase；语言内部命名遵循各自社区规范（Rust 模块与函数 snake_case、类型 PascalCase；Go 按阿里规范大小写；TS 变量函数 camelCase、类型组件 PascalCase、文件 kebab-case），两端差异只允许在序列化边界一处消除。
43. 命名转换只允许用框架属性声明：Rust `#[serde(rename_all = "camelCase")]`、Go 结构体 `json` tag；禁止手写字段映射表和通用 snake↔camel 转换函数，也不允许为迁就一端把传输字段改成下划线。
44. 整型 ID 一律字符串：i64/u64 直传超过 JS Number 安全整数范围（2^53-1）会静默丢精度；序列化成 string，前端不再 parseInt。
45. 精确数值禁 float：金额、汇率用整数最小单位 + 单位/币种字段（`{ amount: 500, currency: "CNY" }`）；百分比用 0–100 数值，禁 `"50%"` 字符串。
46. 尺寸与时长只传基本单位整数：字节、毫秒、秒各自传整数；`"1.5 MB"`、`"03:24"` 这类可读格式只由前端展示层产出，传输层永远不出带单位的字符串。
47. 时间一律 UTC 毫秒时间戳（number）：禁字符串日期、禁秒级、禁本地时区时间戳；时刻字段命名 `xxxAt`，非毫秒单位的字段名必须带单位（timeoutMs、durationSeconds）；前端按 locale 格式化，后端不产出展示格式。
48. 布尔只传 `true`/`false`：禁 0/1 与 `"true"` 字符串；字段名带 is/has/can 语义前缀，禁反义命名（isDisable 之类）。
49. 枚举序列化为 string 字面量：禁数字枚举；TS 侧用 string literal union + zod `z.enum` 对齐；Rust 枚举上的 `#[serde(rename_all)]` 改的是变体名（即内部标签 `tag` 的值），struct variant 的内部字段要另加 `rename_all_fields` 才会转换；两端增删枚举值同一 commit 改。
50. 空列表返 `[]` 不返 `null`；`null` 只表示"明确没有"且必须在 schema 里显式声明（Rust `Option<T>` ↔ TS `T | null`），不许用 null 或缺字段表达空字符串和 0。
51. 请求参数区分"未传"与"零值"：Go 用指针、Rust 用 `Option` 且不加 `#[serde(default)]`（`default`/`omitempty` 只用于解析外部响应或读旧数据）——给新增请求字段兜底默认值会掩盖前端漏传。
52. 字典 key 一律字符串；有序数据一律数组，禁把 JSON 对象当数字索引列表用（TS 端对象 key 会变字符串，回 Rust/Go 还要再 parse）。
53. 契约两端同源且同步演进：serde 模型/struct 与 zod schema 是同一契约的两份手写副本，改一端同一 commit 改另一端；能用生成器（ts-rs、openapi codegen、protobuf）就不手写，项目已约定生成入口时优先走生成器；响应必须过 schema 校验再进 UI，禁 `as T` 裸转与 any——校验失败就是"后端改了签名"，必须立刻暴露，不许静默兜底。
54. 命令与事件命名分层固定：IPC 命令名 snake_case（对齐 Rust 函数名）；事件名 kebab-case 字符串常量，两端常量镜像（Rust `names` 模块 ↔ 前端 `EVENTS`），只改一端的静默失效要靠测试或注释钉住。
55. 参数与载荷一律用静态类型承载，禁裸 JSON/map 拼装：Rust 定义 `struct`（`Serialize`/`Deserialize`），Go 定义结构体 + `json` tag，TS 用 zod schema + `z.infer` 推导类型；`serde_json::json!`、`map[string]any`、对象字面量只允许出现在测试 fixture 与日志序列化，不允许作为 IPC payload、事件载荷、第三方请求体或查询参数的类型来源。
56. 前端禁 `any`：类型没写对就 `unknown` + 收窄，不许拿 `any`/`as any` 绕过编译检查，`@ts-ignore` 与无理由 `eslint-disable` 同禁；确实绕不开的第三方无类型面，局部声明类型或收窄后 cast 并在注释里写明为什么。此条由 ESLint 钉死（`@typescript-eslint/no-explicit-any` 及 `no-unsafe-*` 系列，配 type-aware 规则），报错清零再交付（第 18 条）。
