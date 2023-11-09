CREATE DATABASE school;

USE school;

-- exercise 1: create tables
CREATE TABLE students
  (
     id         INT PRIMARY KEY auto_increment,
     first_name VARCHAR(20)
  );

CREATE TABLE papers
  (
     id          INT PRIMARY KEY auto_increment,
     title       VARCHAR(50),
     grade       INT,
     students_id INT,
     FOREIGN KEY (students_id) REFERENCES students(id) ON DELETE CASCADE
  );

-- exercise 2: insert data
INSERT INTO students
            (first_name)
VALUES      ('Caleb'),
            ('Samantha'),
            ('Raj'),
            ('Carlos'),
            ('Lisa');

INSERT INTO papers
            (students_id,
             title,
             grade)
VALUES      (1,
             'My First Book Report',
             60),
            (1,
             'My Second Book Report',
             75),
            (2,
             'Russian Lit Through The Ages',
             94),
            (2,
             'De Montaigne and The Art of The Essay',
             98),
            (4,
             'Borges and Magical Realism',
             89);

-- exercise 3: get inner join
SELECT first_name,
       title,
       grade
FROM   students
       JOIN papers
         ON students.id = papers.students_id
ORDER  BY grade DESC;

-- exercise 4: left join
SELECT first_name,
       title,
       grade
FROM   students
       LEFT JOIN papers
              ON students.id = papers.students_id
ORDER  BY grade DESC;

-- exercise 5: left join with null handling
SELECT first_name,
       Ifnull(title, 'MISSING') AS title,
       Ifnull(grade, 0)         AS grade
FROM   students
       LEFT JOIN papers
              ON students.id = papers.students_id
ORDER  BY grade DESC;

-- exercise 6: average student grades
SELECT first_name,
       Ifnull(Avg(grade), 0) AS average
FROM   students
       LEFT JOIN papers
              ON papers.students_id = students.id
GROUP  BY first_name
ORDER  BY average DESC;

-- exercise 7: determine whether students' passing status
SELECT first_name,
       Ifnull(Avg(grade), 0) AS average,
       CASE
         WHEN Avg(grade) < 75 THEN 'FAILING'
         ELSE 'PASSING'
       end                   AS passing_status
FROM   students
       LEFT JOIN papers
              ON papers.students_id = students.id
GROUP  BY first_name
ORDER  BY average DESC; 