﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AngularWebAPI.API.Controllers
{
    public class SessionController : BaseController
    {
        [AcceptVerbs("Get")]
        public void GetSession()
        {
            
            if (base.CurrentSession == null)
            {
                base.NewSession();
            }
        }
    }
}
