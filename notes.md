# Learn `neo4j`, `Cypher` and more

## Cypher Query Language


Cypher is a graph query language that is used to query the Neo4j Database. 
Cypher is like SQL - a declarative, textual query language.

In writing a cypher query, a **node** is enclosed between a **parenthesis** — like `(p:Person)` where `p` is a variable and `Person` is the type of node it is referring to.

**Relationships** are enclosed in square **brackets** - like `[w:WORKS_FOR]` where `w` is a variable and `WORKS_FOR` is the type of relationship it is referring to.

Putting it all together, the query below will return all people who have worked in Cloud Atlas movie.

```cypher=
MATCH (p:Person)-[relatedTo]-(m:Movie {title: "Cloud Atlas"})
RETURN p, m, relatedTo
```

Cypher is easy to learn and even more powerful and concise to write than SQL.

In graph, because we don't need join tables, Cypher expresses connections as graph patterns and is easy to read.

For example, if you want to find all actors that Tom Hanks has worked with, then below are the Cypher and SQL queries to fetch the data.

Cypher
```cypher=
MATCH (tom:Person {name: 'Tom Hanks'})-[a:ACTED_IN]->(m:Movie)<-[rel:ACTED_IN]-(p:Person)
return p, a, rel, m, tom
```

SQL
```sql=
SELECT * FROM persons p JOIN roles r ON (p.id = r.person_id)
JOIN movies m ON (m.id = r.movie_id)
JOIN roles r2 ON (m.id = r2.movie_id)
JOIN persons p2 ON (p2.id = r2.person_id)
WHERE p2.name = "Tom Hanks"
```

For more about Cypher, you may have a look [here](https://neo4j.com/developer/cypher/).


## AuraDB

*What are the the AuraDB Free database limits?*

The free database is limited on graph size: 50K nodes and 175K relationships.


*How long can I use the Free database?*
The database is free forever, no credit card required. 
It will **be automatically paused** if you do not use it for **72 hours**. But don't worry, you can resume the database at any time within 90 days.


## neo4j 

neo4J is a **native** graph database. 
Each node contains direct pointers to all the nodes that it is connected to.
These direct pointers are called *relationships*.
All the information needed to find the next node in a sequence is available in the node itself. 
The native storage layer is a connected graph, that's what *native* means.

Because of this principle neo4j does not need to compute the relationships between your data at query time, 
the connections are already there stored right in the database. 
Therefore, neo4J does not need an index system!



