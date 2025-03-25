# MODELS

**Author**
- id (auto incrementing PK)
- author_name:string
- author_rating:string

**Publisher**
- id (auto incrementing PK)
- publisher_name:string
- publisher_revenue:string

**Book**
- id (auto incrementing PK)
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

A Book can be written by one or many authors and one or many authors can write one or many books.
A join table will be used called **book_author**.

# Routes

- **GET /**
  Home Page (handled by HomeController#index)

- **Books**
  - GET /books
    Show all Books (BooksController#index)
  - GET /books/:id
    Show a Book by ID (BooksController#show)

- **Publishers**
  - GET /publishers
    Show all Publishers (PublishersController#index)
  - GET /publishers/:id
    Show a Production Company by ID (PublishersController#show)

- **Pages**
  - GET /pages
    Show all Pages (PagesController#index)
  - GET /pages/new
    Display the form for creating a new Page (PagesController#new)
  - POST /pages
    Create a new Page (PagesController#create)
  - GET /pages/:id/edit
    Display the form for editing a Page (PagesController#edit)
  - PATCH/PUT /pages/:id
    Update a Page (PagesController#update)
  - DELETE /pages/:id
    Delete a Page (PagesController#destroy)

# Controllers

- HomeController - index
- BooksController - index, show
- PublishersController - index, show
- PagesController - index, new, create, show, edit, update, destroy
