CREATE PROCEDURE dbo.GetArtistAlbums
@artistId INT = -1, 
	@quantity int = 99
AS
BEGIN

	SELECT  top (@quantity)
	a.albumID as AlbumId,
	a.title as AlbumName,  
	a.imageURL as AlbumImage,    
	a.year  as Year  
	FROM  Album a
	WHERE  
		a.artistId = @artistId  
		order by a.dateCreation
END
