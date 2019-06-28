const express = require('express');
const app = express();
const http = require('http')
const path = require('path')
const morgan = require('morgan')

// init web server 
const server = http.createServer(app)

// set port
app.set('port', process.env.PORT || 3000);
app.use(express.static(path.join(__dirname, '../cashout/dist/cashout/')))


// start server
server.listen(app.get('port'), () => {
    console.log('App is running on localhost:%d', app.get('port'))
})

app.use(morgan('combined'))

app.get('/', (req, res)=> {
    res.sendFile(path.join(__dirname, '../cashout/dist/cashout/index.html'))
})
