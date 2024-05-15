//constantes de librerias

//ubicaciones del proyecto
const path = require("path");
const express = require("express");
//ejecución de la aplicación
//inicialización de proyectos
const app = express(); //formato json 
app.use(express.json()); //acceptación de información
app.use(express.urlencoded()); //comunicación
const fs = require('fs');
//validaciones


//inicialización de aplicación.
app.use(express.static(path.join(__dirname, 'public')));

//index
app.get('/', (request, response) => {
    response.sendFile('./public/views/index.html', {root: __dirname})
});

//servidor 
const PUERTO = process.env.PORT || 3001;
app.listen(PUERTO, () => {
    console.log('el servidor está escuchando en http://localhost:3000')
});