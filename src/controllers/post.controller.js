const PostModel = require('../models/post.model');

const getAllPosts = async (req, res) => {
    try {
        const posts = await PostModel.getAll();
        res.json(posts);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const getPostById = async (req, res) => {
    try {
        const post = await PostModel.getById(req.params.id);
        if (!post) {
            return res.status(404).json({ error: 'Post no encontrado' });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const getPostsByAuthor = async (req, res) => {
    try {
        const posts = await PostModel.getByAuthorId(req.params.authorId);
        res.json(posts);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const createPost = async (req, res) => {
    try {
        const newPost = await PostModel.create(req.body);
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const updatePost = async (req, res) => {
    try {
        const updatedPost = await PostModel.update(req.params.id, req.body);
        res.json(updatedPost);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const deletePost = async (req, res) => {
    try {
        const result = await PostModel.delete(req.params.id);
        if (result === 0) {
            return res.status(404).json({ error: 'Post no encontrado' });
        }
        res.json({ message: 'Post eliminado correctamente' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = {
    getAllPosts,
    getPostById,
    getPostsByAuthor,
    createPost,
    updatePost,
    deletePost
};
