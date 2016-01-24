-- \i has_many_blogs.sql;

-- SELECT * FROM users;


-- SELECT *
-- FROM posts
-- INNER JOIN users
-- ON posts.id=users.id
-- WHERE user_id=100;


-- SELECT posts.*, first_name, last_name
-- FROM posts
-- INNER JOIN users
-- ON posts.id=users.id
-- WHERE user_id=200;


SELECT posts.*, users.username
FROM posts
INNER JOIN users
ON posts.id=users.id
WHERE first_name='Norene' AND last_name='Schmitt';