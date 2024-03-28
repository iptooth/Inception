const http = require('http');
const fs = require('fs');
const path = require('path');

const port = 3000;

const server = http.createServer(function(req, res){
    let filePath = '.' + req.url;
    if (filePath === './') {
        filePath = './index.html';
    }

    const extname = path.extname(filePath);
    let contentType = 'text/html';

    switch (extname) {
        case '.js':
            contentType = 'text/javascript';
            break;
        case '.css':
            contentType = 'text/css';
            break;
    }

    fs.readFile(filePath, function(error, content) {
        if (error) {
            if(error.code === 'ENOENT'){
                res.writeHead(404);
                res.end('Error: File Not Found');
            }
            else {
                res.writeHead(500);
                res.end('Error: ' + error.code);
            }
        }
        else {
            res.writeHead(200, { 'Content-Type': contentType });
            res.end(content, 'utf-8');
        }
    });
});

server.listen(port, function(error) {
    if (error) {
        console.log('Error: ', error);
    } else {
        console.log('Server is listening on port ' + port);
    }
});


