const express = require('express');
const mysql = require('mysql');

const app = express();

const db = mysql.createConnection({
  host: 'localhost',
  port: 3307,
  user: 'root',
  password: '12345',
  database: 'medicare'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Conectado a la base de datos');
});

app.get('/api/data', (req, res) => {
  let sql = 'SELECT * FROM usuarios';
  db.query(sql, (err, results) => {
    if(err) throw err;
    res.json(results);
  });
});

app.listen(3000, () => {
  console.log('Servidor iniciado en el puerto 3000');
});