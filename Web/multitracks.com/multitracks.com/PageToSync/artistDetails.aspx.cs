using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageToSync_artistDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int artistId = Convert.ToInt32(Request.QueryString["artistId"]);  

            var sql = new SQL();  

            sql.Parameters.Add("@artistId", 1);

          DataTable data = sql.ExecuteStoredProcedureDT("GetArtistDetails");

            var dd = data.Rows[0]["imageURL"].ToString();
            var ddx = data.Rows[0]["title"].ToString();
            // Bind the data to the controls in your page here, for example:
            // imgArtistImage.ImageUrl = data.Rows[0]["ImageUrl"].ToString();
            // lblArtistName.Text = data.Rows[0]["Name"].ToString();
            // etc...
        }
    }
}