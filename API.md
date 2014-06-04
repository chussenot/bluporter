# API
This platform provide an  **API** that delivers **JSON** stream. 

This API, 

* respect  **REST** rules of use
* have coherent return **HTTP** codes (40x,50x,20x)
* is accessible from the **'URL** https://api.DOMAIN.com/v1/ by building **URLs** from the segments listed in this document.

## HTTP status codes Overview  

+ **200 OK** - Everything worked as expected.
+ **204 OK** - Everything worked as expected. (No message Body)
+ **400 Bad Request** - Often missing a required parameter.
+ **401 Unauthorized** - No valid API key provided.
+ **402 Request Failed** - Parameters were valid but request failed.
+ **404 Not Found** - The requested item doesn't exist.
+ **500, 502, 503, 504 Server errors** - something went wrong on Clergerie's end.

## Binary
 Pictures filetype **PNG** are encoded in text format **Base64**  directly into the JSON response.

## User
### POST /users
This **endpoint** to create a resource of type **User**, an email is sent to the user with instructions to validate his account. This email contains the link to activate an account. The link is valid for a day of 3 days.

+ **Params:** `{email:'chussenot@gmail.com'}`
+ **Response 200** (application/json;charset=utf-8)

```json  
      {
        'success': 'true',
        'userId': '16785'
      }
```
### GET /users/{:userId}
Return a **User** information about a user from their email or userId

+ **Params:** userId
+ **Response 200** (application/json;charset=utf-8)

```json   
      {
        'id': '16785',
        'email': 'chussenot@gmail.com',
        'firstName': 'Clément',
        'lastName': 'Hussenot'
        'pseudo': 'chussenot',
        'confirmed': 'true',
        'confirmed_at': '2014-03-08'
      }
```

### PUT /users/{:userId}
Update a resource **User** on the server by providing a comprehensive resource.

+ **Params:** userId
+ **Response 200** (application/json;charset=utf-8)

### PATCH /users/{:userId}
Update a resource **User** on the server providing only a few changed attributes.

+ **Params:** userId
+ **Response 200** (application/json;charset=utf-8)

### DELETE /users/{:userId}
Remove a resource type **User**

+ **Params:** userId
+ **Response 204** (application/json;charset=utf-8)

## Travels

### GET /users/{:userId}/travels
Return user last travels, the URL segment {:userId} is mandatory.

+ **Params:**
  + **?limit=10** limit the number of items
  + **?offset=10** add a set of results

+ **Response 200** (application/json;charset=utf-8)

```json
      {    
        'userId': '6789',
        [
          {
            'departure_date': '2014-04-09',
            'from': {          
              'lat': '46,5904674',
              'lng': '2,5120176000000356'
              'name': 'Monaco'
            },
            'from': {          
              'lat': '46,5904674',
              'lng': '2,5120176000000356'
              'name': 'Berlin'
            },
            'description': 'Very fast'
          }
        ]
      }
```

### GET /travels
Return travels

+ **Params:**
  + **?limit=10** limit the number of items
  + **?offset=10** add a set of results

+ **Response 200** (application/json;charset=utf-8)

```json
      [
        {
          'departure_date': '2014-04-09',
          'from': {          
            'lat': '46,5904674',
            'lng': '2,5120176000000356'
            'name': 'Monaco'
          },
          'from': {          
            'lat': '46,5904674',
            'lng': '2,5120176000000356'
            'name': 'Berlin'
          },
          'description': 'Very fast'
        }
```

### POST /travels/:travel_id/book
**User** can book a teleporter **Travel**

