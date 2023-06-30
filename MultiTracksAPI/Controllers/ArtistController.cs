using DataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Dynamic;

namespace MultiTracksAPI.Controllers
{
    public class ArtistController : ControllerBase
    {
        [HttpGet("search/{name}")]
        public IActionResult Search(string name)
        {
            var sql = new SQL();

            sql.Parameters.Add("@name", name);

            DataTable data = sql.ExecuteStoredProcedureDT("SearchArtistByName");

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

        [HttpGet("list")]
        public IActionResult List(int pageNumber = 1, int pageSize = 10)
        {
            var sql = new SQL();

            sql.Parameters.Add("@PageNumber", pageNumber);
            sql.Parameters.Add("@PageSize", pageSize);

            DataTable data = sql.ExecuteStoredProcedureDT("GetSongsWithPaging");

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
