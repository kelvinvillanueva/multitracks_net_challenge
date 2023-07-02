using DataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Dynamic;

namespace MultiTracksAPI.Controllers
{
    public class SongsController : ControllerBase
    {
        private readonly IConfiguration configuration;

        public SongsController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        [HttpGet("list")]
        public IActionResult List(int artistId = -1, int albumId = -1, int pageNumber = 1, int pageSize = 10)
        {
            var sql = new SQL(configuration.GetConnectionString("admin"), true);

            sql.Parameters.Add("@ArtistId", artistId);
            sql.Parameters.Add("@AlbumId", albumId);
            sql.Parameters.Add("@PageNumber", pageNumber);
            sql.Parameters.Add("@PageSize", pageSize);

            DataTable data = sql.ExecuteStoredProcedureDT("GetArtistSongsWithPaging");

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
