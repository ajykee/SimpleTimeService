const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  const clientIp =
    req.headers['x-forwarded-for'] || req.socket.remoteAddress || null;

  res.json({
    timestamp: new Date().toISOString(),
    ip: clientIp,
  });
});

app.listen(port, () => {
  console.log(`SimpleTimeService is running at http://localhost:${port}`);
});

