const mysql = require('mysql2');

// Configuración directa y sencilla
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', // Tu contraseña aquí
    database: 'vidrieria_melendes'
});

// Conectar
connection.connect((err) => {
    if (err) {
        console.error('Error conectando: ' + err.stack);
        return;
    }
    console.log('¡Conectado a MySQL con éxito!');
    
    // Prueba rápida: Mostrar los productos
    connection.query('SELECT * FROM productos', (error, results) => {
        if (error) throw error;
        console.log('Productos en la base de datos:');
        console.table(results);
        
        // Cerrar la conexión al terminar la prueba
        connection.end();
    });
});
