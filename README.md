# PlayWithDocker
1. Build and run simple command, git branch `using-entry-point`
```bash
docker build -t image-test --target test .
docker run image-test command1
docker run image-test nodeVersion
```
Integrate wdio tests, git branch `adding-wdio-tests`
```bash
npm init
npm install @wdio/cli --save
npx wdio config
```
To run the wdio tests, use any of the below commands
```
npx wdio run ./wdio.conf.js
npm run wdio:local
```

