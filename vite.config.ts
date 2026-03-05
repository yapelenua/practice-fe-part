import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  preview: {
  port: Number(process.env.PORT) || 5173,
  host: true,
  allowedHosts: [
    'testovanie-297525666584.europe-west1.run.app'
  ]
}
})
