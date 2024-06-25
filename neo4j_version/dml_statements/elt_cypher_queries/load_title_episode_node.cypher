LOAD CSV WITH HEADERS FROM 'file:///title_episode_node.csv.gz' AS line FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:TITLE_EPISODE {
    tconst:line.tconst,
    seasonNumber:toInteger(line.seasonNumber),
    episodeNumber:toInteger(line.episodeNumber)})
} IN TRANSACTIONS OF 1000 ROWS;