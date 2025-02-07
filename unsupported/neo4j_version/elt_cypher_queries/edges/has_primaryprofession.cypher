LOAD CSV WITH HEADERS FROM 'file:///has_primaryprofession_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_NAME_BASICS {nconst: line.nconst}), (y:IMDB_PRIMARYPROFESSION {profession: line.profession})
 CREATE (x)-[:HAS_PRIMARYPROFESSION]->(y)
} IN TRANSACTIONS OF 1000000 ROWS