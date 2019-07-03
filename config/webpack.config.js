const path = require('path');
const MODE = "development";
const enabledSourceMap = MODE === "development";

module.exports = {
  mode: 'development',
  entry: './src/app.js',
  module: {
    rules: [
      {
        test: /(\.css|\.scss)/,
        use: [
          "style-loader",
          {
            loader: "css-loader",
            options: {
              url: false,
              sourceMap: enabledSourceMap,
              importLoaders: 2
            }
          },
          {
            loader: "sass-loader",
            options: {
              sourceMap: enabledSourceMap
            }
          }
        ]
      }
    ]
  },
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, '../build')
  }
};
