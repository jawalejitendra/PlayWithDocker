const merge = require('deepmerge');
const wdioConf = require('./wdio.conf.js');

const chrome = {
  browserName: 'chrome',
};
const chromeDocker = {
  'goog:chromeOptions': {
    args: ['--disable-dev-shm-usage', '--no-sandbox', '--remote-debugging-port=9222'],
  },
  ...chrome,
};

exports.config = merge(
  wdioConf.config,
  {
    capabilities: process.env.IS_DOCKER ? [chromeDocker] : [chrome],
  },
  { clone: false },
);


console.log("config: " + JSON.stringify(this.config));
