const pool = require('../config/db');

// Obtener todos los posts con la información del autor
const getAll = async () => {
    const [rows] = await pool.query(`
        SELECT posts.*, authors.name as author_name, authors.email as author_email, authors.image as author_image
        FROM posts
        LEFT JOIN authors ON posts.author_id = authors.id
    `);
    return rows;
};

// Obtener un post por ID
const getById = async (id) => {
    const [rows] = await pool.query(`
        SELECT posts.*, authors.name as author_name, authors.email as author_email, authors.image as author_image
        FROM posts
        LEFT JOIN authors ON posts.author_id = authors.id
        WHERE posts.id = ?
    `, [id]);
    return rows[0];
};

// Obtener posts de un autor específico
const getByAuthorId = async (authorId) => {
    const [rows] = await pool.query('SELECT * FROM posts WHERE author_id = ?', [authorId]);
    return rows;
};

// Crear un nuevo post
const create = async ({ title, description, category, author_id }) => {
    const [result] = await pool.query(
        'INSERT INTO posts (title, description, category, author_id) VALUES (?, ?, ?, ?)',
        [title, description, category, author_id]
    );
    return { id: result.insertId, title, description, category, author_id };
};

// Actualizar un post existente
const update = async (id, { title, description, category, author_id }) => {
    await pool.query(
        'UPDATE posts SET title = ?, description = ?, category = ?, author_id = ? WHERE id = ?',
        [title, description, category, author_id, id]
    );
    return getById(id);
};

// Eliminar un post
const remove = async (id) => {
    const [result] = await pool.query('DELETE FROM posts WHERE id = ?', [id]);
    return result.affectedRows;
};

module.exports = {
    getAll,
    getById,
    getByAuthorId,
    create,
    update,
    delete: remove
};
