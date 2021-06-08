CREATE OR ALTER PROCEDURE [spGetCoursesByCategory] 
    @CategoryId UNIQUEIDENTIFIER
AS
    SELECT * FROM [Course] WHERE [CategoryId] = @CategoryId