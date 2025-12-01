# Ejercicio 8: Diseño de API con base de datos MySQL

Este proyecto implementa una API REST para gestionar un blog con autores y posts, utilizando Node.js, Express y MySQL.

## Requisitos

- Node.js
- MySQL

## Instalación

1. Instalar dependencias:
   ```bash
   npm install
   ```

2. Configurar la base de datos:
   - Importar el archivo `blog_db.sql` en MySQL Workbench o mediante línea de comandos.
   - Crear un archivo `.env` (basado en las credenciales de tu BD) con las variables:
     ```
     DB_HOST=localhost
     DB_USER=tu_usuario
     DB_PASSWORD=tu_contraseña
     DB_NAME=blog_db
     DB_PORT=3306
     ```

## Ejecución

- Modo desarrollo:
  ```bash
  npm run dev
  ```
- Modo producción:
  ```bash
  npm start
  ```

## Endpoints Principales

- `GET /api/authors`: Listar autores
- `GET /api/posts`: Listar posts (con datos de autor)
- `GET /api/posts/author/:authorId`: Posts de un autor específico
