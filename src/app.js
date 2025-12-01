const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
app.use(cors()); // Habilita CORS para permitir peticiones desde otros dominios
app.use(express.json()); // Habilita el parseo de JSON en el cuerpo de las peticiones

// Rutas de la API
app.use('/api', require('./routes/api'));

const PORT = process.env.PORT || 3000;

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
