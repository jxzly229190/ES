using System.Collections.Generic;
using System.Web.Mvc;

namespace ES.Server
{
    public class Tools
    {
        public static IList<SelectListItem> GetStatusByTableName()
        {
            var list = new List<SelectListItem>()
            {
                new SelectListItem(){Text = "正常",Value = "0", Selected = true},
                new SelectListItem(){Text = "注销",Value = "1"},
                new SelectListItem(){Text = "删除",Value = "255"}
            };

            return list;
        }  
    }
}