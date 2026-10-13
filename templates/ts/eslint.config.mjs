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
      // 无理由的 eslint-disable 同禁；放行必须在同行注释写明原因
      '@typescript-eslint/ban-ts-comment': 'error',
    },
  },
)
