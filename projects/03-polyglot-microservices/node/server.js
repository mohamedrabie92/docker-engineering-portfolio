const http = require('node:http');
http.createServer((req, res) => {
  if (!['/', '/health'].includes(req.url)) { res.writeHead(404); res.end(); return; }
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ service: 'node', status: 'ok' }));
}).listen(8080, '0.0.0.0');
