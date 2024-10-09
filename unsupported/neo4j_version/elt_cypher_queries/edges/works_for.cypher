LOAD CSV WITH HEADERS FROM 'file:///works_for_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {principal_id: line.principal_id}), (y:IMDB_TITLE_BASICS {tconst: line.tconst})
 CREATE (x)-[:WORKS_FOR]->(y)
} IN TRANSACTIONS OF 1000000 ROWS