const pool = require('../config/db');

// Obtener todos los autores
const getAll = async () => {
    const [rows] = await pool.query('SELECT * FROM authors');
    return rows;
};

// Obtener un autor por su ID
const getById = async (id) => {
    const [rows] = await pool.query('SELECT * FROM authors WHERE id = ?', [id]);
    return rows[0];
};

// Crear un nuevo autor
const create = async ({ name, email, image }) => {
    const [result] = await pool.query(
        'INSERT INTO authors (name, email, image) VALUES (?, ?, ?)',
        [name, email, image]
    );
    return { id: result.insertId, name, email, image };
};

// Actualizar un autor existente
const update = async (id, { name, email, image }) => {
    await pool.query(
        'UPDATE authors SET name = ?, email = ?, image = ? WHERE id = ?',
        [name, email, image, id]
    );
    return getById(id);
};

// Eliminar un autor
const remove = async (id) => {
    const [result] = await pool.query('DELETE FROM authors WHERE id = ?', [id]);
    return result.affectedRows;
};

module.exports = {
    getAll,
    getById,
    create,
    update,
    delete: remove
};
