LOAD CSV WITH HEADERS FROM 'file:///attributes_node.csv.gz' AS line  FIELDTERMINATOR ';'
CALL {
    with line
    CREATE (n:ATTRIBUTE {
    attribute:line.attribute})
} IN TRANSACTIONS OF 1000 ROWS;