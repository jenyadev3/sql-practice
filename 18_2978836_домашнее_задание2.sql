SELECT DISTINCT name FROM author;

SELECT DISTINCT name FROM author WHERE name GLOB 'С. А.*';

SELECT DISTINCT title FROM book INNER JOIN publisher ON book.publisher_id = publisher.id WHERE publisher.name = "Мир";

SELECT category.title, count(DISTINCT book.title) AS book_count FROM book 
INNER JOIN category ON book.category_id = category.id 
GROUP BY category.title 
ORDER BY book_count;

SELECT publisher.name, count(DISTINCT book.title) AS book_count FROM book 
INNER JOIN publisher ON book.publisher_id = publisher.id 
GROUP BY publisher.name HAVING book_count > 2 ORDER BY book_count DESC;

SELECT DISTINCT title FROM book
INNER JOIN authorbook ON book.id = authorbook.book_id
WHERE author_id IN (SELECT id FROM author WHERE name = 'С. А. Айвазян');

SELECT publisher.name, count(DISTINCT book.title) AS book_count FROM book 
INNER JOIN publisher ON book.publisher_id = publisher.id 
INNER JOIN authorbook ON book.id = authorbook.book_id
WHERE author_id IN (SELECT id FROM author WHERE name = 'С. А. Айвазян')
GROUP BY publisher.name ORDER BY book_count DESC;

