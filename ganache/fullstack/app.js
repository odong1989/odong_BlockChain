var express = require("express");
var app = express();
var server = require("http").createServer(app);
var io = require("socket.io")(server);
server.listen(8080);

const Web3 = require('web3');
const web3 = new Web3('http://localhost:8545');


web3.eth.getBlockNumber(function(error, result){
    console.log(result);
})

web3.eth.getBlockNumber().then(console.log);

app.use(express.static("public"));
app.get("/", function(req, res) {
    res.sendFile(__dirname + "/index.html");
})