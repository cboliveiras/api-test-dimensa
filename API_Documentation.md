# API Documentation

Headers
  - Accept: application/json
  - Content-Type: application/json

```json
### POST /v1/movies/import

- Parameters: CSV file containing movie data to be imported.

- Response (200 OK)

 { "message": "Import successful" }

 - Response (422 Unprocessable Entity)

 {
  "errors": [
    "Title has already been taken",
    ...
    ]
 }

### GET /v1/movies

- Response (200 OK):
[
  {
    "id": 224,
    "title": "A Clockwork Orange",
    "genre": "Movie",
    "year": "1971",
    "country": "United Kingdom, United States",
    "published_at": "2020/11/01",
    "description": "In this dark satire from director Stanley Kubrick, a young, vicious sociopath in a dystopian England undergoes an experimental rehabilitation therapy."
  },
  {
    "id": 173,
    "title": "300 Miles to Heaven",
    "genre": "Movie",
    "year": "1989",
    "country": "Denmark, France, Poland",
    "published_at": "2019/10/01",
    "description": "Hoping to help their dissident parents, two brothers sneak out of Poland and land as refugees in Denmark, where they are prevented from returning home."
  },
  ...
]

### GET /v1/movies?year=2020

- Response (200 OK)

[
  {
    "id": 263,
    "title": "13 Reasons Why",
    "genre": "TV Show",
    "year": "2020",
    "country": "United States",
    "published_at": "2020/06/05",
    "description": "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice."
  },
  {
    "id": 272,
    "title": "18 Presents",
    "genre": "Movie",
    "year": "2020",
    "country": "Italy",
    "published_at": "2020/05/08",
    "description": "A pregnant mother with terminal cancer leaves behind 18 sentimental gifts for her unborn daughter to receive every birthday until she reaches womanhood."
  },
  ...
]

### GET /v1/movies?genre=Movie

- Response (200 OK)

[
  {
    "id": 355,
    "title": "A Clockwork Orange",
    "genre": "Movie",
    "year": "1971",
    "country": "United Kingdom, United States",
    "published_at": "2020/11/01",
    "description": "In this dark satire from director Stanley Kubrick, a young, vicious sociopath in a dystopian England undergoes an experimental rehabilitation therapy."
  },
  {
    "id": 304,
    "title": "300 Miles to Heaven",
    "genre": "Movie",
    "year": "1989",
    "country": "Denmark, France, Poland",
    "published_at": "2019/10/01",
    "description": "Hoping to help their dissident parents, two brothers sneak out of Poland and land as refugees in Denmark, where they are prevented from returning home."
  },
  ...
]

## GET /v1/movies?country=Canada

- Response (200 OK)

[
  {
    "id": 286,
    "title": "21 Thunder",
    "genre": "TV Show",
    "year": "2017",
    "country": "Canada",
    "published_at": "2018/03/01",
    "description": "Players and coaches for a Montreal soccer team chase dreams of stardom while their personal lives erupt with love, fear, passion and violence."
  },
  {
    "id": 312,
    "title": "48 Christmas Wishes",
    "genre": "Movie",
    "year": "2017",
    "country": "Canada",
    "published_at": "2017/12/20",
    "description": "When a small town's letters to Santa accidentally go up in smoke, two elves venture out of the North Pole to retrieve every missing wish."
  },
  ...
]

## GET /v1/movies?published_at=2021

- Response (200 OK)

[
  {
    "id": 303,
    "title": "30 Minutes or Less",
    "genre": "Movie",
    "year": "2011",
    "country": "United States",
    "published_at": "2021/01/01",
    "description": "Two crooks planning a bank heist wind up abducting a pizza delivery driver and force him to commit the robbery — with a strict time limit."
  },
  {
    "id": 367,
    "title": "A Monster Calls",
    "genre": "Movie",
    "year": "2016",
    "country": "United Kingdom, Spain, United States",
    "published_at": "2021/01/16",
    "description": "Overwhelmed by his mother’s illness, a young boy begins to understand human complexity through the fantastic tales of a consoling tree monster."
  },
  ...
]

If you want, you can filter using more than one filter:

## GET v1/movies?published_at=2021&country=United%20States

(to filter movies from United States that were published in 2021)

- Response (200 OK)

[
  {
    "id": 271,
    "title": "17 Again",
    "genre": "Movie",
    "year": "2009",
    "country": "United States",
    "published_at": "2021/01/01",
    "description": "Nearing a midlife crisis, thirty-something Mike wishes for a \"do-over\" – and that's exactly what he gets when he wakes up to find he's 17 again."
  },
  {
    "id": 303,
    "title": "30 Minutes or Less",
    "genre": "Movie",
    "year": "2011",
    "country": "United States",
    "published_at": "2021/01/01",
    "description": "Two crooks planning a bank heist wind up abducting a pizza delivery driver and force him to commit the robbery — with a strict time limit."
  }
]
