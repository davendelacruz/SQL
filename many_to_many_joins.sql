-- exercise 1: get title and rating
SELECT 
	title,
	rating
FROM series
JOIN reviews ON series.id = reviews.series_id;

-- exercise 2: get title and average rating sorted

SELECT 
	title,
	ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id;
GROUP  BY title
ORDER  BY avg_rating;

-- exercise 3: get reviewers rating
SELECT 
	first_name,
	last_name,
	rating
FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- exercise 4: find series with no reviews
SELECT title as 'Unreviewed Series'
FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating is NULL;

-- exercise 5: find average genre rating
SELECT 
    	genre, 
	ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;

-- exercise 6: indepth reveiwer data
SELECT 
	first_name,
	last_name,
	COUNT(rating) AS COUNT,
	IFNULL(MIN(rating),0) AS MIN,
	IFNULL(MAX(rating),0) AS MAX,
	IFNULL(ROUND(AVG(rating),2), 0) AS AVG,
	CASE 
		WHEN COUNT(rating)>0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS STATUS
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

-exercise 7: get title, rating and reveiwer
SELECT 
	title,
	rating,
	CONCAT(first_name,' ', last_name) AS reviewer
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY title;

