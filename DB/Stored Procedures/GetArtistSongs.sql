CREATE PROCEDURE dbo.GetArtistSongs
@artistId INT = -1,
	@albumId INT = -1,
	@quantity int = 99
AS
BEGIN

	SELECT 
	    top (@quantity)

	s.title as SongName , 
	a.title as AlbumName, 
	a.imageURL as AlbumImage,
	s.bpm as BPM,  
	'4/4' as Rate  
	FROM Song s, Album a
	WHERE  
		s.artistId = @artistId 
		and s.albumID = a.albumID
	    AND (@albumId = -1 OR s.albumID = @albumId)
		order by s.dateCreation
END
