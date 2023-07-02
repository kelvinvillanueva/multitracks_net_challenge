using DataAccess;
using System;
using System.Data;

public partial class PageToSync_albumDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int artistId = Convert.ToInt32(Request.QueryString["artistId"]);
            int albumId = Convert.ToInt32(Request.QueryString["albumId"]);

            var sql2 = new SQL();
            sql2.Parameters.Add("@artistId", artistId);
            sql2.Parameters.Add("@albumId", albumId);
            DataTable songsData = sql2.ExecuteStoredProcedureDT("GetArtistSongs");
            if (songsData.Rows.Count > 0)
            {
                rptSongs.DataSource = songsData;
                rptSongs.DataBind();
            }
            var sql = new SQL();
            sql.Parameters.Add("@artistId", artistId);

            DataTable artistData = sql.ExecuteStoredProcedureDT("GetArtistDetails");
            if (artistData.Rows.Count > 0)
            {
                var artistName = artistData.Rows[0]["ArtistName"].ToString(); 

                lblAlbumName.Text = songsData.Rows[0]["AlbumName"].ToString(); ;
                imgArtistBanner.ImageUrl = artistData.Rows[0]["BannerImage"].ToString();
                imgArtistBanner.AlternateText = artistName;

                imgArtist.ImageUrl = songsData.Rows[0]["AlbumImage"].ToString();
                imgArtist.AlternateText = artistName;
            }

        }
    }
}