const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Conexión directa (Sin archivos extra)
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'vidrieria_melendes'
});

db.connect(err => {
    if (err) {
        console.error('Error al conectar a MySQL:', err);
    } else {
        console.log('Base de datos conectada.');
    }
});

// Ruta simple para obtener productos
app.get('/productos', (req, res) => {
    db.query('SELECT * FROM productos', (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

app.listen(3000, () => {
    console.log('Servidor en http://localhost:3000');
});
