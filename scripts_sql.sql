-- -- Вывести полную информацию о книге по названию
-- SELECT Books.id, Books.name, Authors.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation, Categories.name_category, Categories.name_section, Types.type FROM Books
-- JOIN Book_categories ON Books.id = Book_categories.id_book
-- JOIN Book_authors ON Books.id = Book_authors.id_book
-- JOIN Book_types ON Books.id = Book_types.id_book
-- JOIN Categories ON Categories.id = Book_categories.id_category
-- JOIN Authors ON Authors.id = Book_authors.id_author
-- JOIN Types ON Types.id = Book_types.id_type
-- WHERE Books.name = 'Электрический привод';

-- -- Вывести книги жанра "Фэнтези"
-- SELECT Books.id, Books.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation, Categories.name_category, Categories.name_section FROM Books 
-- JOIN Book_categories ON Books.id = Book_categories.id_book
-- JOIN Categories ON Book_categories.id_category = Categories.id
-- WHERE Categories.name_section = 'Фэнтези';

-- -- Подсчитать количество книг в бумажном виде
-- SELECT COUNT(Books.id) FROM Books 
-- JOIN Book_types ON Books.id = Book_types.id_book
-- JOIN Types ON Types.id = Book_types.id_type
-- WHERE Types.type = 'бумажный';

-- -- Вывести id книги, которая содержит наибольшее количество томов
-- SELECT Books.id 
-- FROM Books
-- JOIN Books_parts ON Books.id = Books_parts.id_book
-- JOIN Parts ON Parts.id = Books_parts.id_part
-- GROUP BY Books.id
-- ORDER BY COUNT(Books.name) DESC
-- LIMIT 1;

-- -- Вывести книги определенного автора – Карл Поппер
-- SELECT Books.id, Books.name, Authors.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation FROM Books
-- JOIN Book_authors ON Books.id = Book_authors.id_book
-- JOIN Authors ON Authors.id = Book_authors.id_author
-- WHERE Authors.name = 'Карл Поппер';

-- -- Вывести книги, изданные в 2020 году
-- SELECT Books.id, Books.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation FROM Books
-- WHERE Books.year_publishing = 2020;

-- -- Вывести книги, относящиеся к категории "Учебная литература"
-- SELECT Books.id, Books.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation, Categories.name_category, Categories.name_section FROM Books 
-- JOIN Book_categories ON Books.id = Book_categories.id_book
-- JOIN Categories ON Book_categories.id_category = Categories.id
-- WHERE Categories.name_category = 'Учебная литература';

-- -- Вывести все книги, оригиналы которых есть в каталоге
-- SELECT Books.id, Books.name, Books.publishing_office, Books.year_publishing, Books.language, Books.annotation FROM Books 
-- JOIN Origin_links ON Books.id = Origin_links.id_transl;

-- -- Рассчитать количество книг, выпущенных каждым издательство
-- SELECT Books.publishing_office, COUNT(Books.id) FROM Books
-- GROUP BY Books.publishing_office
-- ORDER BY COUNT(Books.id) DESC;

-- Вывести книги с определенным словом («жизнь») в аннотации
SELECT * FROM Books
WHERE Books.annotation LIKE '%жизнь%'
   OR Books.annotation LIKE '%жизни%'
   OR Books.annotation LIKE '%жизнью%';
