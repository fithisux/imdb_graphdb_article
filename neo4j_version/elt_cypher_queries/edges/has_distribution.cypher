LOAD CSV WITH HEADERS FROM 'file:///distribution_types_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {ID: toInteger(line.ID)}), (y:IMDB_DISTRIBUTION_TYPE {distribution_type: toInteger(line.distribution_type)})
 CREATE (x)-[:HAS_DISTRIBUTION]->(y)
} IN TRANSACTIONS OF 1000 ROWS