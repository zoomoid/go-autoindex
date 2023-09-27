const defaultConfig = require("tailwindcss/defaultConfig")

/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: "media",
  content: ["./src/**/*.{html,js,css}", "./index.html"],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "IBM Plex Sans",
          ...defaultConfig.theme.fontFamily["sans"],
        ]
      }
    },
  },
  plugins: [],
}
