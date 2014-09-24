using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QuestServ.WebAPI.Controllers
{
    public class SessionController : BaseController
    {
        [AcceptVerbs("Get")]
        public void GetSession()
        {
            base.NewSession();
        }
    }
}
