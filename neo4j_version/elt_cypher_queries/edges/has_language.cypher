LOAD CSV WITH HEADERS FROM 'file:///language_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {ID: toInteger(line.ID)}), (y:IMDB_LANGUAGE_CODE {alpha2: toInteger(line.alpha2)})
 CREATE (x)-[:HAS_LANGUAGE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS