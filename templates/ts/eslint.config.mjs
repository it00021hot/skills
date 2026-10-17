// dev-habits『前端禁 any』『调试残留清零』『工具链报错清零』的 TS 落地。
// ESLint 9+ flat config 加 typescript-eslint v8；用法：拷入项目根目录，
// 依赖装进 devDependencies 并锁版本，不随 CI 静默升级。
import js from '@eslint/js'
import tseslint from 'typescript-eslint'

export default tseslint.config(
  { ignores: ['dist', 'node_modules', 'coverage'] },
  js.configs.recommended,
  ...tseslint.configs.recommendedTypeChecked,
  {
    languageOptions: {
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
    rules: {
      // 『前端禁 any』：类型没写对就 unknown 加收窄
      '@typescript-eslint/no-explicit-any': 'error',
      '@typescript-eslint/no-unsafe-assignment': 'error',
      '@typescript-eslint/no-unsafe-member-access': 'error',
      '@typescript-eslint/no-unsafe-argument': 'error',
      '@typescript-eslint/no-unsafe-call': 'error',
      '@typescript-eslint/no-unsafe-return': 'error',
      // 『调试残留清零』：console.log 清零，warn/error 留给正式日志出口
      'no-console': ['error', { allow: ['warn', 'error'] }],
      // 『函数只做一件事』『嵌套限深』『参数收敛』：提醒档——warn 级加放宽阈值，
      // 只拦明显失控的结构，不逼着为拆而拆造碎片函数
      'max-lines-per-function': ['warn', { max: 100, skipBlankLines: true, skipComments: true }],
      complexity: ['warn', 15],
      'max-depth': ['warn', 3],
      'max-params': ['warn', 4],
      // 无理由的 eslint-disable 同禁；放行必须在同行注释写明原因
      '@typescript-eslint/ban-ts-comment': 'error',
      // 『依赖无环』TS 侧选配：需先装 eslint-plugin-import（devDependencies 锁版本）；
      // 未装时按 SKILL.md 机械条款表「已知缺口」行靠审查兜底
      // 'import/no-cycle': ['error'],
    },
  },
)
