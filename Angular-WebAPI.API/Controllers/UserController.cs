using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AngularWebAPI.API.Controllers
{
    public class UserController : ApiController
    {
        [AcceptVerbs("PUT")]
        public void Put()
        {

        }
        [AcceptVerbs("GET")]
        public void Get(string email, string password)
        {

        }
    }
}
