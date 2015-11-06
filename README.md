##Flashr

A flashcard-inspired game for testing your general knowledge.

## API

**Authentication Notes**:

To make an authenticated request in any case other than registering
or deleting an account, you must supply an `Access-Token` header with
a valid auth token. Otherwise, you'll receive a 401 Forbidden error.

### Registering an Account

#### POST `/signup`

**Params**:

`username`: A username, must be unique.
`full_name`: The user's full name.
`email`: An email address, must be unique.
`password`: A password.

**Response**:

If the user was created successfully, you should receive status code 201 and ...

```
{
  "user": {
    "username": "johndough",
    "full_name": John Dough
    "email": "john@gooddough4u.pls.com",
    "auth_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
  }
}
```

If the user could not be created, you should receive status code 422 and ...

```
{
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```

### Deleting an Account

#### DELETE `/signup`

**Params**:

`email`: Your user account's email address.
`password`: Your user account's password.

**Response**:

If the request was successful, you should receive status code 202 and ...

`The user has been deleted successfully.`

If the request was unsuccessful, you should receive status code 401 and ...


```
{
  "error": "Invalid email (#{params[:email]}) or password."
}
```

### Logging In

#### POST `/login`

**Params**:

`username`: String
`password`: String 

**Response**:

If the request was successful, you should receive status code 201 and ...

```
{
  "user": {
    "email": "john@gooddough4u.pls.com",
    "auth_token": "9f5b8ebf876121c3fc4c0fa18a511e16"
  }
}
```

If the user could not be found, you should receive status code 401 and ...

```
{
  "error": Either could not find user for #{params[:username]} or the password was incorrect."
}
```

### Displaying an Index of Decks

#### Get `decks

**Response**

If the request was successful, you should receive the status code 200 for all the decks.

```
{"decks":[{"title":"#@%*","id":1},{"title":"#@%*","id":2},{"title":"#@%*","id":3},{"title":"#@%*","id":4},{"title":"#@%*","id":5},{"title":"#@%*","id":6},{"title":"#@%*","id":7},{"title":"#@%*","id":8},{"title":"cricket","id":9},{"title":"new","id":10},{"title":"new","id":11},{"title":"new","id":14},{"title":"I_am_fastest_man_alive","id":15},{"title":"Fastest Man Alive","id":16}]}

```


### Creating a New Deck

#### POST `decks

If the request was successful, you should receive the status code 200 and for each instance of the deck ...

````
{
  "deck": {
    "title": "Fastest Man Alive",
    "id": 16
  }
}
```
If the request failed, you should receive the status code 417 and ...

{"error":"Deck was not found. The new deck was not created successfully."}

### Updating an Existing Deck

#### PUT `/decks/:id`

**Query Params**:

`id`: the ID of the deck belongs to (Integer)

**Response**

If the request was successful, you should receive the status code 200 and for each instance of the deck ...

```{"deck":{
      "title":" I Am The Fastest Man Alive","id":16}}```

If the request failed, you should receive the status code 417 and ...

```{error: "Either the deck was not found or it does not belong to #{current_user.username}"},```

### Delete a deck

#### DELETE `cards/:id`

**Query Params**

`id`: The ID of the Deck you'd like to destroy

**Response**

If the request was accepted, you should receive status code 202 and ...

```{ reponse: "The card has been deleted successfully."}```

If the request failed, you should receive status code 401 and ... 

```
{
  "error": "The deck you requested does not exist, or #{current_user.username} isn't authorized to delete it."
}
```


### Displaying an Index of Cards

#### GET `decks/:id/cards`

**Query Params**:

`id`: the ID of the deck the card belongs to (Integer)

**Response**

If the request was successful, you should receive the status code 200 and for each instance of a card ...

```
{
  "card": {
    "id": 5
    "question": "What color is a giraffe's tongue?",
    "answer": "golden"
    "deck_id": 3
  }
}
```

If no cards could be found, you should receive status code 404 and ...

```
{
  "error": "There are no cards to display."
}
```

### Creating a New Card

#### POST `decks/:id/cards`

**Query Params**

`id`: the ID of the deck the card belongs to (Integer)

**Post Params**

`question`: the question to be displayed on the card
`answer`: the correct answer to the question

**Response**

If the request was successful, you should receive the status code 201 and ...

```
{
  "card": {
    "id": 5
    "question": "What color is a giraffe's tongue?",
    "answer": "golden"
    "deck_id": 3
  }
}
```
If the request failed, you should receive status code 417 and ...
```
{
  "error": "Deck was not found. The new card was not created successfully."
}
```

### Updating an Existing Card

#### PUT `cards/:id`

**Query Params**

`id`: the ID of the card you'd like to update

**Post Params**

`question`: the question to be displayed on the card
`answer`: the correct answer to the question

**Response**

If the request was accepted, you should receive status code 202 and ...

```
{
  "card": {
    "id": 5
    "question": "What color is a giraffe's tongue?",
    "answer": "golden"
    "deck_id": 3
  }
}
```

If the request failed, you should receive status code 417 and ...

```
{
  "error": Either the card was not found or it does not belong to #{current_user.username}"
}
```

### Delete a Card

#### DELETE `cards/:id`

**Query Params**

`id`: The ID of the card you'd like to destroy

**Response**

If the request was accepted, you should receive status code 202 and ...

``The card has been deleted successfully.``

If the request failed, you should receive status code 401 and ... 

```
{
  "error": "The card you requested does not exist, or #{current_user.username} isn't authorized to delete it."
}
```