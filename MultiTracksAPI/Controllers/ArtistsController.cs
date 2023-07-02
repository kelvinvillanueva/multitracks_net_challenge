using DataAccess;
using Microsoft.AspNetCore.Mvc;
using MultiTracksAPI.Dtos;
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

        [HttpPost("create")]
        public IActionResult CreateArtist([FromBody] ArtistDto artistDto)
        {
            sql.Parameters.Add("@title", artistDto.Title);
            sql.Parameters.Add("@biography", artistDto.Biography);
            sql.Parameters.Add("@imageURL", artistDto.ImageURL);
            sql.Parameters.Add("@heroURL", artistDto.HeroURL);

            sql.ExecuteStoredProcedure("CreateArtist");

            return Ok("Artist created successfully.");
        }

    }
}
