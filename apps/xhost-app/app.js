const express = require('express');
const app = express();
const PORT = 8080;

app.get('/', (req, res) => {
    const xHost = req.headers['x-host'];
    const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    res.send(`Hello user, you came from host IP: ${ip} and your target is ${xHost} URL.`);
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});