LOAD CSV WITH HEADERS FROM 'file:///title_principals_cleansed_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:TITLE_PRINCIPALS {
    tconst:line.tconst,
    nconst:line.nconst,
    job:line.job,
    characters:line.characters,
    ordering:toInteger(line.ordering),
    episodeNumber:toInteger(line.episodeNumber)})
} IN TRANSACTIONS OF 1000 ROWS;