CREATE PROCEDURE dbo.GetArtistSongsWithPaging
	@ArtistId INT = -1,
	@AlbumId INT = -1,
	@PageNumber int = 10,
	@PageSize int = 1
AS
BEGIN

	SELECT 

	s.title as SongName , 
	a.title as AlbumName, 
	a.imageURL as AlbumImage,
	s.bpm as BPM,  
	'4/4' as Rate  
	FROM Song s, Album a
	WHERE   
	 (@artistId = -1 OR s.artistId = @artistId)
		and s.albumID = a.albumID
	    AND (@AlbumId = -1 OR s.albumID = @AlbumId)
		order by s.dateCreation
END
