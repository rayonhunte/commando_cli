const express = require('express');
const app = express();
const http = require('http')
const path = require('path')
const morgan = require('morgan')
const fs = require('fs')

// init web server 
const server = http.createServer(app)

// set port
app.set('port', process.env.PORT || 3000);
app.use(express.static(path.join(__dirname, '../cashout/dist/cashout/')))


var accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' })


// start access log
app.use(morgan('common', {stream: accessLogStream}))


// start server
server.listen(app.get('port'), () => {
    console.log('App is running on localhost:%d', app.get('port'))
})

app.get('/', (req, res)=> {
    res.sendFile(path.join(__dirname, '../cashout/dist/cashout/index.html'))
})

app.get('/all', (req, res) => {
    res.status(200).send('cool')
})