const express = require('express');
const favicon = require('express-favicon');
const path = require('path');

const fs = require('fs');
const https = require('https');
const http = require('http');


const privateKey = fs.readFileSync(process.env.APPTRACKER_CERT_PATH+'/apptracker.club-key.pem', 'utf8');
const certificate = fs.readFileSync(process.env.APPTRACKER_CERT_PATH+'/apptracker.club-crt.pem', 'utf8');
const ca = fs.readFileSync(process.env.APPTRACKER_CERT_PATH+'/apptracker.club-chain.pem', 'utf8');

const credentials = {
	key: privateKey,
	cert: certificate,
	ca: ca
};

const app = express();
app.use(favicon(__dirname + '/build/favicon.ico'));
// the __dirname is the current directory from where the script is running
app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, 'build')));
app.get('/ping', function (req, res) {
 return res.send('pong');
});
app.get('/*', function (req, res) {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

const httpsServer = https.createServer(credentials, app);
http.createServer(function (req, res) {
    res.writeHead(301, { "Location": "https://" + req.headers['host'] + req.url });
    res.end();
}).listen(80);

httpsServer.listen(443, () => {
	console.log('HTTPS Server running on port 443');
});