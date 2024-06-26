LOAD CSV WITH HEADERS FROM 'file:///rate_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)}), (y:IMDB_TITLE_RATINGS {ratetconst: toInteger(line.ratetconst)})
 CREATE (x)-[:HAS_RATE]->(y)
} IN TRANSACTIONS OF 1000 ROWS