LOAD CSV WITH HEADERS FROM 'file:///name_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {ID: toInteger(line.ID)}), (y:IMDB_NAME_BASICS {nconst: toInteger(line.nconst)})
 CREATE (x)-[:HAS_NAME]->(y)
} IN TRANSACTIONS OF 1000000 ROWS