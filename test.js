const { Elm } = require('./worker.js')

const app = Elm.Worker.init()

app.ports.consoleLog.subscribe(message => console.log(message))
