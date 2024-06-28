LOAD CSV WITH HEADERS FROM 'file:///title_basics_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:IMDB_TITLE_BASICS {
    tconst:line.tconst,
    primaryTitle:line.primaryTitle,
    originalTitle:line.originalTitle,
    isAdult:toBoolean(line.isAdult),
    startYear:toInteger(line.startYear),
    endYear:toInteger(line.endYear),
    runtimeMinutes:toInteger(line.runtimeMinutes)})
} IN TRANSACTIONS OF 1000000 ROWS;