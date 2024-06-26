LOAD CSV WITH HEADERS FROM 'file:///primaryprofession_edge.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
 WITH line
 MATCH (x:IMDB_NAME_BASICS {nconst: toInteger(line.nconst)}), (y:IMDB_PRIMARYPROFESSION {profession: toInteger(line.profession)})
 CREATE (x)-[:HAS_PRIMARYPROFESSION]->(y)
} IN TRANSACTIONS OF 1000 ROWS