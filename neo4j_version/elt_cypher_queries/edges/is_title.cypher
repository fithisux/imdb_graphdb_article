LOAD CSV WITH HEADERS FROM 'file:///title_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_EPISODE {epitconst: toInteger(line.epitconst)}), (y:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)})
 CREATE (x)-[:IS_TITLE]->(y)
} IN TRANSACTIONS OF 1000 ROWS