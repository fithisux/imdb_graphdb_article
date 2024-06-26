LOAD CSV WITH HEADERS FROM 'file:///works_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {ID: toInteger(line.ID)}), (y:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)})
 CREATE (x)-[:WORKS_FOR]->(y)
} IN TRANSACTIONS OF 1000 ROWS