using DataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Dynamic;

namespace MultiTracksAPI.Controllers
{
    public class ArtistsController : ControllerBase
    {
        private readonly SQL sql;

        public ArtistsController(SQL sql)
        {
            this.sql = sql;
        }

        [HttpGet("search/{name}")]
        public IActionResult Search(string name)
        {
            
            sql.Parameters.Add("@artistName", name);

            DataTable data = sql.ExecuteStoredProcedureDT("GetArtistDetails");

            var list = new List<dynamic>();
            foreach (DataRow row in data.Rows)
            {
                dynamic obj = new ExpandoObject();
                foreach (DataColumn col in data.Columns)
                {
                    ((IDictionary<string, object>)obj)[col.ColumnName] = row[col];
                }
                list.Add(obj);
            }

            return Ok(list);
        }

       
    }
}
