-- sqlite3

-- show all tables
-- .tables
ar_internal_metadata  books_categories      members             
author_profiles       books_genres          published_dates     
authors               books_tags            publishers          
book_loans            categories            reviews             
books                 genres                schema_migrations   
books_authors         libraries             tags 

-- show all columns in a table
.schema books
.schema authors
.schema books_authors

-- count all rows in a table
select count(*) as 'count of authors' from authors;
select count(*) as 'count of books' from books;
select count(*) as 'count of books_authors' from books_authors;
select count(*) as 'count of books_categories' from books_categories;
select count(*) as 'count of books_genres' from books_genres;
select count(*) as 'count of books_tags' from books_tags;
select count(*) as 'count of categories' from categories;
select count(*) as 'count of genres' from genres;
select count(*) as 'count of tags' from tags;
select count(*) as 'count of libraries' from libraries;
select count(*) as 'count of members' from members;
select count(*) as 'count of published_dates' from published_dates;
select count(*) as 'count of publishers' from publishers;
select count(*) as 'count of reviews' from reviews;


