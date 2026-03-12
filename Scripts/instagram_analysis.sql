-- 1. finding 5 oldest users
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;

-- 2. most popular registration date
SELECT 
    DAYNAME(created_at) AS day,
    count(*) as total
FROM
    users
GROUP BY day   -- to use group by on the created_at we have to give it an alias
order by total desc;

-- 3. identitfy inactive users (users with no photos)
SELECT 
    count(username)
FROM
    users
        LEFT JOIN
    photos ON photos.user_id = users.id
WHERE
    photos.id IS NULL;
    
-- 4. Most likes on a single photo.
select * from photos;

select * from likes;

SELECT 
    username, photos.id, photos.image_url, COUNT(*) AS total
FROM
    photos
        JOIN
    likes ON likes.photo_id = photos.id
        JOIN
    users ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC;

-- 5. Calculate avg number of photos per user

select (select count(*) from photos) /
(select count(*) from users) as avg;

-- 6. Top 5 hashtags

select * from tags;

select * from photo_tags;

SELECT 
    tag_name, COUNT(*) AS total
FROM
    tags
        JOIN
    photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY total DESC
limit 5;

-- 7. Find users with likes on all photos

SELECT 
    username, COUNT(*) AS bots
FROM
    likes
        JOIN
    users ON users.id = likes.user_id
GROUP BY username
HAVING bots = (SELECT 
        COUNT(*)
    FROM
        photos);