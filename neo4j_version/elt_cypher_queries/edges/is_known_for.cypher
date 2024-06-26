LOAD CSV WITH HEADERS FROM 'file:///knownfor_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_NAME_BASICS {nconst: toInteger(line.nconst)}), (y:IMDB_TITLE_BASICS {tconst: toInteger(line.tconst)})
 CREATE (x)-[:IS_KNOWNFOR]->(y)
} IN TRANSACTIONS OF 1000 ROWS