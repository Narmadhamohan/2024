const express = require('express');
const { MongoClient } = require('mongodb');
const app = express();
const port = 3000;

const uri = 'mongodb://localhost:27017'; // Your MongoDB URI
const client = new MongoClient(uri);

app.get('/data', async (req, res) => {
  try {
    await client.connect();
    const database = client.db('test');
    const collection = database.collection('students');
    const data = await collection.find({}).toArray();
    res.json(data);
  } catch (e) {
    console.error(e);
    res.status(500).send('Error fetching data');
  } finally {
    await client.close();
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
