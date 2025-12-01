const router = require('express').Router();
const authorController = require('../controllers/author.controller');
const postController = require('../controllers/post.controller');

router.get('/authors', authorController.getAllAuthors);
router.get('/authors/:id', authorController.getAuthorById);
router.post('/authors', authorController.createAuthor);
router.put('/authors/:id', authorController.updateAuthor);
router.delete('/authors/:id', authorController.deleteAuthor);

router.get('/posts', postController.getAllPosts);
router.get('/posts/:id', postController.getPostById);
router.get('/posts/author/:authorId', postController.getPostsByAuthor);
router.post('/posts', postController.createPost);
router.put('/posts/:id', postController.updatePost);
router.delete('/posts/:id', postController.deletePost);

module.exports = router;
