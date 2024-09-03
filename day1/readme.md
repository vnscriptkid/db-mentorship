# Day 1 Tasks -
1. Start learning MongoDB - https://www.mongodb.com/docs/manual/introduction/
2. Spin up a FREE FOREVER cluster on MongoDB Atlas (MongoDB Cloud) to learn and test your hands-on exercises - https://www.mongodb.com/docs/manual/tutorial/getting-started/
3. What are Databases, Collections, Documents? https://www.mongodb.com/docs/manual/core/databases-and-collections/
IMP: Do not learn about Views, Capped Collections and Clustered Collections.
4. Basic CRUD operations - https://www.mongodb.com/docs/manual/crud/
Important to see syntax, and then the examples...
5. Learn about Query Operators (How to use and when to use) - https://www.mongodb.com/docs/manual/reference/operator/query/

# Playground
- CRUD
```sh
use mydb;

db.myCol.insertOne({name: 'thanh'});
db.myCol.insertOne({name: 'linh'});

db.myCol.find();

db.myCol.updateMany({name: 'thanh'}, {$set: {name: 'thanh new'}});

db.myCol.deleteMany({name: 'linh'});
```