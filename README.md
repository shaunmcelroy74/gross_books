# README

# MODELS
Author
  - id (auto incremeting PK)
  - author_name:string
  - author_rating:string

Publisher
  - id (auto incremeting PK)
  - publisher_name:string
  - publisher_revenue:string

Book
  - id (auto incremeting PK)
  - book_name:string
  - publishing_year:integer
  - language_code:string
  - book_average_rating:decimal
  - book_ratings_count:integer
  - genre:string
  - gross_sales:string
  - sale_price:string
  - sale_rank:integer
  - units_sold:integer

# Many to Many Relationship
A Book can be written by one or many authors and one or many authors can write one or many books
A join table will be used called book_author

# Routes

GET /                (Home Page)
GET /books           (Show all Books)
GET /books/:id       (Show a Book by ID)
GET /publishers      (Show all Publishers)
GET /publishers/:id  (Show a Production Company by ID)

# Controllers

HomeController - index
BooksController - index, show
PublishersController - index, show
