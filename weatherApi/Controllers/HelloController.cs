using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace weatherApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "Hi how r u?";
        }
    }
}
