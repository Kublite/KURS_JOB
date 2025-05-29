import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

export default defineConfig({
  plugins: [react()],
  base: "/", // если на хостинге сайт в корне
  server: {
    proxy: {
      "/api": "http://localhost", // работает только при dev-сервере
    },
  },
});
