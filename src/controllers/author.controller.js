const AuthorModel = require('../models/author.model');

const getAllAuthors = async (req, res) => {
    try {
        const authors = await AuthorModel.getAll();
        res.json(authors);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const getAuthorById = async (req, res) => {
    try {
        const author = await AuthorModel.getById(req.params.id);
        if (!author) {
            return res.status(404).json({ error: 'Autor no encontrado' });
        }
        res.json(author);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const createAuthor = async (req, res) => {
    try {
        const newAuthor = await AuthorModel.create(req.body);
        res.status(201).json(newAuthor);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const updateAuthor = async (req, res) => {
    try {
        const updatedAuthor = await AuthorModel.update(req.params.id, req.body);
        res.json(updatedAuthor);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const deleteAuthor = async (req, res) => {
    try {
        const result = await AuthorModel.delete(req.params.id);
        if (result === 0) {
            return res.status(404).json({ error: 'Autor no encontrado' });
        }
        res.json({ message: 'Autor eliminado correctamente' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = {
    getAllAuthors,
    getAuthorById,
    createAuthor,
    updateAuthor,
    deleteAuthor
};
