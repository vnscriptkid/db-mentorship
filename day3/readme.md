# Day 3

- Pre Requisites -
- Spin up an M0 free cluster on MongoDB Atlas (free forever)
    - (Check the Atlas UI method) https://www.mongodb.com/docs/atlas/getting-started/
- Load sample dataset
    - Present on the above link
- Perform Queries (make sure you use .find method only)

- Build queries for these problems -
1. In collection - mflix.movies, find all the movies released on or after the year 2000.
2. Find all movies where Madeleine Koehler plays in the movie (in the cast)
3. Find all movies with more than 60 rotten tomatoes reviews and a rotten tomatoes rating between 4 to 5 (included)
4. Find movies with comments more than 50 or an imdb rating more than 7.
5. Find the movies released in the year 1990 or 1995 or 2000 or 2001 or 2003

# Playground
```sh
docker compose exec -it mongo bash

mongosh "mongodb+srv://test.nuyn0.mongodb.net/" --apiVersion 1 --username xxx --password xxx

show dbs

use sample_mflix

show collections

# released format: ISODate('2001-01-05T00:00:00.000Z')
db.movies.find({ released: { $gte: ISODate('2000-01-01T00:00:00.000Z'), $lt: ISODate('2003-01-01T00:00:00.000Z') } })

db.movies.find({ cast: { $elemMatch: { $regex: /Madeleine/i } } })

db.movies.find({ 
    "tomatoes.viewer.numReviews": { $gte: 4, $lte: 5 },
    "tomatoes.viewer.rating": { $gte: 4, $lte: 5 }
})

db.movies.find({
    $or: [
        {num_mflix_comments: {$gt: 50}},
        {"imdb.rating": { $gt: 7 }}
    ]
})

db.movies.find({
    $expr: {
        $in: [{ $year: "$released" }, [1990, 1995, 2000, 2001, 2003]]
    }
})
```