using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AngularWebAPI.API.Object
{
    public class Session
    {
        public string IPAddress
        {
            get;
            set;
        }
        public string UserAgent
        {
            get;
            set;
        }
        public DateTime LastAccessed
        {
            get;
            set;
        }
    }
}