CREATE PROCEDURE dbo.GetArtistDetails
 @artistId INT = -1,
    @artistName NVARCHAR(255) = NULL
AS
BEGIN
    SELECT 
        a.title as ArtistName, 
        a.biography,  
        a.imageURL as ArtistImage, 
        a.heroURL as BannerImage
    FROM Artist a 
    WHERE  
        (@artistId = -1 OR a.artistId = @artistId) AND
        (@artistName IS NULL OR a.title LIKE '%' + @artistName + '%') 
    ORDER BY a.dateCreation
END
