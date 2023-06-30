using DataAccess;
using System;

public partial class Default : MultitracksPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var sql = new SQL();

        try
        { 
            var data = sql.ExecuteStoredProcedureDT("GetAssessmentSteps");

            assessmentItems.DataSource = data;
            assessmentItems.DataBind();

            publishDB.Visible = false;
            items.Visible = true;
        }
        catch 
        {
            publishDB.Visible = true;
            items.Visible = false;
        }
    }
}
