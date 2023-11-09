USE book_shop;

-- exercise 1: select books written before 1980
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       released_year                           AS Year
FROM   books
WHERE  released_year < 1980;

-- exercise 2: select books written by eggers and chabon
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       released_year                           AS Year
FROM   books
WHERE  author_lname IN ( 'Eggers', 'Chabon' );

-- exercise 3: select books written by lahiri after 2000
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       released_year                           AS Year
FROM   books
WHERE  author_lname = 'Lahiri'
       AND released_year > 2000;

-- exercise 4: select books with pages between 100 and 200
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       released_year                           AS Year
FROM   books
WHERE  pages BETWEEN 100 AND 200;

-- exercise 5: select books where surname starts with C or S
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       released_year                           AS Year
FROM   book
WHERE  Substr(author_lnme, 1, 1) IN ( 'C', 'S' );

-- exercise 6: create a case for certain titles
SELECT title                                   AS Title,
       Concat(author_fname, ' ', author_lname) AS Author,
       CASE
         WHEN title LIKE '%stories%' THEN 'Short Stories'
         WHEN title = 'Just Kids' THEN 'Memoir'
         WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
         ELSE 'Novel'
       END                                     AS TYPE
FROM   books;

-- exercise 7: bonus exercise
SELECT Concat(author_fname, ' ', author_lname) AS Author,
       CASE
         WHEN Count(*) = 1 THEN '1 book'
         ELSE Concat(Count(*), ' books')
       END                                     AS COUNT
FROM   books
GROUP  BY author; 