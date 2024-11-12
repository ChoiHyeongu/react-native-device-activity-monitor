module.exports = {
  presets: ["module:@react-native/babel-preset"],
  plugins: [
    [
      "module-resolver",
      {
        root: ["./"],
        alias: {
          "^@/(.+)": "./src/\\1",
        },
      },
    ],
    "@babel/plugin-proposal-export-namespace-from",
  ],
  env: {
    production: {
      plugins: ["transform-remove-console"],
    },
  },
};
