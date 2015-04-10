using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ES.Server
{
    public static class Extension
    {
        public static void AddErrors(this Controller c, params string[] errors)
        {
            foreach (var error in errors)
            {
                c.ModelState.AddModelError("", error);
            }
        }
    }
}