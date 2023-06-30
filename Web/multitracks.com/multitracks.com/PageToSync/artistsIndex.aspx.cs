using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageToSync_artistsIndex : System.Web.UI.Page
{
    protected string Limit(object text, int length)
    {
        var str = text.ToString();
        if (str.Length > length)
        {
            return str.Substring(0, length) + "...";
        }
        return str;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            var sql = new SQL();  
              
          DataTable data = sql.ExecuteStoredProcedureDT("GetArtists");
             
            Repeater1.DataSource = data;
            Repeater1.DataBind(); 
        }

    }
}