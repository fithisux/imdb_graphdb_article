LOAD CSV WITH HEADERS FROM 'file:///has_distribution_type_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_TITLE_AKAS {akas_id: line.akas_id}), (y:IMDB_DISTRIBUTION_TYPE {distribution_type: line.distribution_type})
 CREATE (x)-[:HAS_DISTRIBUTION_TYPE]->(y)
} IN TRANSACTIONS OF 1000000 ROWS