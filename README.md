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
  "errors": [
    "Invalid email (#{params[:email]}) or password."
  ]
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

If the user could not be created, you should receive status code 401 and ...

```
{
  "errors": [
    Either could not find user for #{params[:username]} or the password was incorrect."
  ]
}
```
