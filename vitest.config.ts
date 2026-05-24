import { defineConfig } from 'vitest/config';
import { resolve } from 'path';

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    include: ['src/**/*.{spec,test}.ts'],
    exclude: ['src/__e2e__/**', 'node_modules', 'dist'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'lcov', 'html', 'json-summary'],
      include: ['src/**/*.ts'],
      exclude: [
        'src/**/*.d.ts',
        'src/**/index.ts',
        'src/**/*.spec.ts',
        'src/**/*.test.ts',
        'src/__e2e__/**',
      ],
      thresholds: {
        branches: 80,
        functions: 80,
        lines: 80,
        statements: 80,
      },
    },
    alias: {
      '@': resolve(__dirname, './src'),
    },
    testTimeout: 10000,
    projects: [
      {
        test: {
          name: 'unit',
          include: ['src/**/*.{spec,test}.ts'],
          exclude: ['src/__e2e__/**'],
        },
      },
      {
        test: {
          name: 'e2e',
          include: ['src/__e2e__/**/*.{spec,test}.ts'],
        },
      },
    ],
  },
});
