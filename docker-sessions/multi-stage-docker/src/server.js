const http = require('http');
const PORT = process.env.PORT || 3000;

const requestHandler = (req, res) => {
    res.writeHead(200, {'Content-Type':'application/json'});
    res.end(JSON.stringify({
        message: "hello from multistage docker file conatiner",
        time: new Date().toISOString(),
    }));
};

const server = http.createServer(requestHandler);

server.listen(PORT, () => {
    console.log('Server is running on port ${PORT}')
})