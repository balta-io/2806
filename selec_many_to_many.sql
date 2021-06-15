SELECT 
    [Career].[Id],
    [Career].[Title],
    [CareerItem].[CareerId],
    [CareerItem].[Title]
FROM 
    [Career] 
INNER JOIN 
    [CareerItem] ON [CareerItem].[CareerId] = [Career].[Id]
ORDER BY
    [Career].[Title]