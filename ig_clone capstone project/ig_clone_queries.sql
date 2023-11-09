--find 5 oldest users to reward them

SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

--figure out which day of the week most users register on

SELECT 
	DAYNAME(created_at) AS Day,
	COUNT(*) AS Total
FROM users
GROUP BY Day
ORDER BY Total
LIMIT 1;

--find users who never posted a photo

SELECT username
FROM users
LEFT JOIN photos
	ON photos.user_id = users.id
WHERE photos.id IS NULL;

--find user with most liked photos

SELECT 
	username,
	photos.id, 
	photos.image_url, 
	COUNT(*) as Total
FROM photos
JOIN likes
 	ON likes.photo_id = photos.id
JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY Total DESC
LIMIT 1;


-- calculate average number of photos per user

SELECT 
	count(photos.id)/count(distinct(users.id)) AS avg_posts_per_person
FROM users
LEFT JOIN photos
	ON photos.user_id = users.id;

--find most popular tags

SELECT  tag_name as Hashtags,
	count(photo_id) AS Total
FROM photo_tags
LEFT JOIN tags
	ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY Total DESC
LIMIT 5;

--find users that liked every single photo on the platform

SELECT username
FROM users
JOIN likes
 ON likes.user_id = users.id
GROUP BY username
HAVING COUNT(*) = (SELECT COUNT(*) FROM photos);