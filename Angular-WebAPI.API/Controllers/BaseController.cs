using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;
using System.Runtime.Caching;
using QuestServ.WebAPI.Object;


namespace QuestServ.WebAPI.Controllers
{
    public abstract class BaseController : ApiController
    {
        private static MemoryCache _cache;
        private static MemoryCache Cache
        {
            get
            {
                return MemoryCache.Default;
            }
        }
        private const string CONST_SESSIONCOOKIEKEY = "qss-id";

        public Guid SessionGuid
        {
            get
            {
                CookieHeaderValue val = Request.Headers.GetCookies(CONST_SESSIONCOOKIEKEY).FirstOrDefault();

                if (val != null)
                {
                    return new Guid(val[CONST_SESSIONCOOKIEKEY].Value.ToString());
                }
                return Guid.Empty;
            }
        }
        public HttpRequest Req
        {
            get
            {
                return HttpContext.Current.Request;
            }
        }
        public HttpResponse Response
        {
            get { return HttpContext.Current.Response; }
        }
        public Session CurrentSession
        {
            get
            {
                return Cache.Get(SessionGuid.ToString()) as Session;
            }
        }
        protected void NewSession()
        {
            Guid newGuid = Guid.NewGuid();
            Response.Cookies.Add(new HttpCookie(CONST_SESSIONCOOKIEKEY, newGuid.ToString()));
            Session session = new Session();
            session.IPAddress = Req.UserHostAddress;//User IP Address
            session.UserAgent = Req.UserAgent;//Basic information about User Browser and environment
            session.LastAccessed = DateTime.UtcNow;
            Cache.Add(new CacheItem(newGuid.ToString(), session), new CacheItemPolicy() { AbsoluteExpiration = DateTime.UtcNow.AddMinutes(15) });//expires at 15 minutes
        }
        protected void GetUser() { }
    }
}
