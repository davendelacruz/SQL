USE book_shop;

-- exercise 1: total books
SELECT Count(*) AS 'Total books'
FROM   books;

-- exercise 2: total books per year
SELECT released_year AS Year,
       Count(*)      AS Total
FROM   books
GROUP  BY year
ORDER  BY year;

-- exercise 3: total books in stock
SELECT Sum(stock_quantity) AS Total
FROM   books;

-- exercise 4: average released year
SELECT Concat(author_fname, ' ', author_lname) AS author,
       Avg(released_year)
FROM   books
GROUP  BY author
ORDER  BY author;

-- exercise 5: full name of the author with longes book
SELECT Concat(author_fname, ' ', author_lname) AS author
FROM   books
WHERE  pages = (SELECT Max(pages)
                FROM   books);

-- exercise 6: yearly book release with average pages of books
SELECT released_year AS year,
       Count(*)      AS '# books',
       Avg(pages)    AS 'avg pages'
FROM   books
GROUP  BY year
ORDER  BY year; 