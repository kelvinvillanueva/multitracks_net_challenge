using DataAccess;
using System;
using System.Data;

public partial class PageToSync_artistDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int artistId = Convert.ToInt32(Request.QueryString["artistId"]);
            var sql = new SQL();
            sql.Parameters.Add("@artistId", artistId);

            DataTable artistData = sql.ExecuteStoredProcedureDT("GetArtistDetails");
            if (artistData.Rows.Count > 0)
            {
                var artistName = artistData.Rows[0]["ArtistName"].ToString();
                var biography = artistData.Rows[0]["biography"].ToString();

                lblArtistName.Text = artistName;
                txtBiography.Text = biography;
            }
            var sql2 = new SQL();
            sql2.Parameters.Add("@artistId", artistId);
            DataTable songsData = sql2.ExecuteStoredProcedureDT("GetArtistSongs");
            if (songsData.Rows.Count > 0)
            {
                rptSongs.DataSource = songsData;
                rptSongs.DataBind();
            }

            var sql3 = new SQL();
            sql3.Parameters.Add("@artistId", artistId);
            DataTable albumsData = sql3.ExecuteStoredProcedureDT("GetArtistAlbums");
            if (albumsData.Rows.Count > 0)
            {
                rptAlbums.DataSource = albumsData;
                rptAlbums.DataBind();
            }
        }
    }
}