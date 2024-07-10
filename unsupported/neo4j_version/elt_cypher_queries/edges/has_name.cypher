LOAD CSV WITH HEADERS FROM 'file:///has_name_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_PRINCIPALS {principal_id: toInteger(line.principal_id)}), (y:IMDB_NAME_BASICS {nconst: toInteger(line.nconst)})
 CREATE (x)-[:HAS_NAME]->(y)
} IN TRANSACTIONS OF 1000000 ROWS