import Express from 'express';
import Mongoose from 'mongoose';
import BodyParser from 'body-parser';
import path from 'path';
import https from  'https';

const app = Express();

app.use(BodyParser.urlencoded({ extended: true }));
app.use(BodyParser.json());

Mongoose.Promise = global.Promise;

try {
  Mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost/cryptos_coins', {
    useMongoClient: true,
  });
  console.log('connected to mongoDB');
} catch (e) {
  console.log('error connecting to mongo');
  process.exit(1);
}

// set up object models

app.get('/user', (req, res) => {

});

const server = app.listen(process.env.PORT || 8080, () => {
  const port = server.address().port;
  console.log("server up and running on port", port);
});
