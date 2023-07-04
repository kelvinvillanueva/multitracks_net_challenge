CREATE PROCEDURE dbo.CreateArtist
    @title VARCHAR(100),
    @biography VARCHAR(MAX),
    @imageURL VARCHAR(500),
    @heroURL VARCHAR(500)
AS
BEGIN
    INSERT INTO [dbo].[Artist]
        (dateCreation, title, biography, imageURL, heroURL)
    VALUES 
        (GETDATE(), @title, @biography, @imageURL, @heroURL)
END

