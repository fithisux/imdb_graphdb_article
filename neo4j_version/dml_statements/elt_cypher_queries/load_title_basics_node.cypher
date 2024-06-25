LOAD CSV WITH HEADERS FROM 'file:///title_basics_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:TITLE_BASICS {
    tconst:line.tconst,
    primaryTitle:line.primaryTitle,
    originalTitle:line.originalTitle,
    startYear:toInteger(line.startYear),
    endYear:toInteger(line.endYear),
    runtimeMinutes:toInteger(line.runtimeMinutes),
    isAdult:toBoolean(line.isAdult)})
} IN TRANSACTIONS OF 1000 ROWS;