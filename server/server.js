const express = require('express');
const app = express();
const http = require('http')
const path = require('path')
const morgan = require('morgan')
const fs = require('fs')
const bodyParser = require('body-parser')

// init list of products
const allProd = [{
        amount: 10,
        name: 'Eggs',
        price: '400',
        id: 1
    },
    {
        amount: 6,
        name: 'Coke Cola',
        price: '100',
        id: 2
    },
    {
        amount: 1,
        name: 'Rice Cake',
        price: '50',
        id: 3
    }, {
        amount: 10,
        name: 'All The Things',
        price: '1000',
        id: 4
    },
    {
        amount: 5,
        name: 'Some Of The Things',
        price: '500',
        id: 5
    }
]


// init web server 
const server = http.createServer(app)

// set port
app.set('port', process.env.PORT || 3000);

app.use(function (req, res, next) {
    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type,x-auth,Authorization,UserId');
    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    // res.setHeader('Access-Control-Allow-Credentials', true);
    // Pass to next layer of middleware
    next();
});

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json())

app.use(express.static(path.join(__dirname, '../cashout/dist/cashout/')))


var accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), {
    flags: 'a'
})


// start access log
app.use(morgan('combined', {
    stream: accessLogStream
}))


// start server
server.listen(app.get('port'), () => {
    console.log('App is running on localhost:%d', app.get('port'))
})

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../cashout/dist/cashout/index.html'))
})

app.get('/all', (req, res) => {
    // array of products
    res.status(200).send(allProd);
})

app.use('/checkout', (req, res, next) => {
    if (!fs.existsSync("checkoutJson.json")) {
        fs.writeFileSync("checkoutJson.json", JSON.stringify(req.body.checkout))
    } else {
        const content = JSON.parse(fs.readFileSync("checkoutJson.json"))
        req.body.checkout.forEach(element => {
            console.log(content.push(element))
        });
        fs.writeFileSync("checkoutJson.json", JSON.stringify(content))
    }
    next()
});

app.post('/checkout', (req, res) => {
    res.status(200).send('ok')
})

app.get('/post', (req, res) => {
    const content = JSON.parse(
        fs.readFileSync("checkoutJson.json")
    )
    res.status(200).send(content)
})
