LOAD CSV WITH HEADERS FROM 'file:///original_title_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {ID: toInteger(line.ID)}), (y:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)})
 CREATE (x)-[:IS_ORIGINALLY]->(y)
} IN TRANSACTIONS OF 1000 ROWS