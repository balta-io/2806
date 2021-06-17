SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[spDeleteStudent] (
    @StudentId UNIQUEIDENTIFIER
)
AS
    BEGIN TRANSACTION
        DELETE FROM 
            [StudentCourse] 
        WHERE 
            [StudentId] = @StudentId

        DELETE FROM 
            [Student] 
        WHERE 
            [Id] = @StudentId
    COMMIT
GO
