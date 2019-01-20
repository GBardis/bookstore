# README

# Project Setup 

1. bundle install
2. rake db:create
3. rake db:migrate
4. rake db:seed

# Endpoints

1. GET http://localhost:3000/books (index)

2. GET http://localhost:3000/books/:id (show)

3. POST http://localhost:3000/books (create)
### Example json to create new book
```javascript
{
  "title": "The Lord of the Rings: The Fellowship of the Ring ",
  "description": "Pariatur molestias ut. Libero odit numquam. Porro omnis odio. Amet sed sunt. Ut doloremque voluptatibus. Harum voluptas facilis.",
  "isbn": "926707366-4",
  "visibility": "visible",
  "creation_date": "Thu, 01 Jan -4712 00:00:00 UTC +00:00",
  "author_ids": [1, 2, 3],
  "publisher_id": 5
}
```

4. PATCH http://localhost:3000/books/:id (update)
### Example json to update book 
```javascript
{
  "title": "The Lord of the Rings: Return Of King",
  "description": "Ab sint dignissimos. Ad laudantium deleniti. Veritatis doloremque animi. Voluptas esse sunt. Aliquam nulla iure. Eos est voluptatem.",
  "isbn": "926707366-4",
  "visibility": "visible",
  "creation_date": "Thu, 01 Jan -4712 00:00:00 UTC +00:00",
  "author_ids": [4, 5, 6],
  "publisher_id": 5
}
```

5. DELETE http://localhost:3000/books/:id (delete)

7. POST http://localhost:3000/authors (create)
### Example json to create new author
```javascript
{
  "email": "george@gmail.org",
  "first_name": "Mrs.",
  "last_name": "Mina",
  "date_of_birth": "Thu, 01 Jan -4712 00:00:00 UTC +00:00"
}
```
7. POST http://localhost:3000/publishers (create)
## Example json to create to new publisher
```javascript
{
  "name": "Pearson",
  "telephone": "879-559-0708 x782",
  "address": "Apt. 504 417 Pat Views, New Ericfort, NM 97876-3115"
}
```
# Note please use postman or similar program to test the endpoints


