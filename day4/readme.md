# Day 4

- Let's start learning about Aggregations! 🚀 
- We will be learning around this for a few days now, the magic starts now! Step by step, lets see what is Aggregations and then start building the most complicated stuff easily! ❤️

- This is going to change the way you look at databases and MongoDB now... 😍 

    - https://www.mongodb.com/docs/manual/aggregation/
    - https://www.mongodb.com/docs/manual/core/aggregation-pipeline/

- For today, Checkout how to use stages like - $match, $project, $sort, $limit, $count.
- Spend the most time in $project, understand how to calculate columns/fields on the fly, do operations and so much more!

# Playground
```sh
db.scores.insertMany([
    {name: "thanh", score: 10},
    {name: "linh", score: 20},
    {name: "thanh", score: 40},
    {name: "nghi", score: 30},
    {name: "thanh", score: 50},
    {name: "phuong", score: 60}
])

db.scores.aggregate([
    {
        "$match": {
            "name": {
                "$in": ["thanh", "linh"]
            }
        }
    },
    {
        "$group": {
            "_id": "$name",
            "total": {
                "$sum": "$score"
            }
        }
    }
])

# [ { _id: 'linh', total: 20 }, { _id: 'thanh', total: 100 } ]

db.scores.aggregate([
    {
        "$match": {
            "name": {
                "$in": ["thanh", "linh", "phuong", "nghi"]
            }
        }
    },
    {
        "$group": {
            "_id": "$name",
            "total": {
                "$sum": "$score"
            }
        }
    },
    {
        "$sort": {
            "total": -1
        }
    },
    {
        "$skip": 2
    },
    {
        "$limit": 2
    },
    {
        "$project": {
            "level": {
                "$switch": {
                    "branches": [
                        { "case": { "$gte": ["$total", 100] }, "then": "A" },
                        { "case": { "$gte": ["$total", 80] }, "then": "B" },
                        { "case": { "$gte": ["$total", 60] }, "then": "C" },
                        { "case": { "$gte": ["$total", 25] }, "then": "D" }
                    ],
                    "default": "F"
                }
            },
            "total": 1
        }
    }
])
```