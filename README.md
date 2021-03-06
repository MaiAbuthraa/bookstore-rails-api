### Create API / rails for an online bookstore

run:
- git clone `git@github.com:MaiAbuthraa/bookstore-rails-api.git`
- cd bookstore-rails-api
- bundle install
- rails s -p 9902


Use PostMan:
- To list all books 
> http://localhost:9902/books

- To create a new 
> Method: post
> Url: http://localhost:9902/books
> Body -> Row -> application/json
```
{
  "book": {
    "title": "Mybook",
    "author": "M.abuthraa"
  }
}
```

###### Note: 
BooksController return these value:
``` render json: @book, status: :created, location: @book```

in the body we will get json response 
```
{
    "id": 4,
    "title": "Mybook",
    "author": "M.abuthraa",
    "created_at": "2020-11-13T10:27:53.552Z",
    "updated_at": "2020-11-13T10:27:53.552Z"
}
```

 status: 201 (201: the origin server must create the resource before returning the 201 status code.)

location: Link for created the resource (show)
> http://localhost:9902/books/4


If we Send a bad requset :
status: 422 (422: Unprocessable Entity response status code indicates that the server understands the content type of the request entity, and the syntax of the request entity is correct, but it was unable to process the contained instructions)

The body we will get json response 
```
{
  "title": [
    "can't be blank"
  ]
}
```

For Rails status code, check this website http://www.railsstatuscodes.com/
