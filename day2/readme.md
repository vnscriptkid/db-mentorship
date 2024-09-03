# Day 2
- Learn what are query operators - https://www.mongodb.com/docs/manual/reference/operator/query/
(This will become your Bible / go-to reference for anything related to query operators later, and there are hundreds of opertors! No need to learn all, just checkout, as we will learn these automatically by using them again n again...)
- Today let's learn how to build multiple logics in our Queries...
- $eq, $or, $in, $exists, $regex, $elemMatch, $all --> these are some important ones...!

# Playground
```bash
use mydb;

db.myCol.insertOne({name: 'thanh'})
db.myCol.insertOne({name: 'linh'})

db.myCol.find({name: {$eq: 'thanh'}})

db.myCol.find({ $or: [{name: {$eq: 'thanh'}}, {name: {$eq: 'linh'}}] })

db.myCol.find({name: {$in: ['thanh', 'linh']}})

db.myCol.find({name: {$exists: true}})

db.myCol.find({name: {$regex: /^t/}})

db.myCol.insertOne({name: 'phuong', colors: ['red', 'blue', 'green']})
db.myCol.insertOne({name: 'nghi', colors: ['red', 'blue', 'yellow']})

# at least one color is red
db.myCol.find({ colors: { $elemMatch: { $eq: 'red' } } })

# contains all colors (red, blue)
db.myCol.find({ colors: { $all: ['red', 'blue'] } })
```