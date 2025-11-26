const express = require('express');
const { createClient } = require('redis')

const app = express();

const client = createClient({ url: 'redis://redis:6379' });

async function init() {
    await client.connect();

    const exists = await client.exists('visits');
    if(!exists){
        await client.set('visits', 0 );
    }
}

init();

app.get('/', async (req, res) => {
    let count = await client.get('visits');
    count = parseInt(count) + 1;
    await client.set('visits', count);

    res.send(`Total visits: ${count}`);
})

app.listen(3000, () => console.log("node app is runniung"));