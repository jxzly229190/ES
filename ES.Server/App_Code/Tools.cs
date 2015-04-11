using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ES.Server
{
    public class Tools
    {
        public static IList<SelectListItem> GetStatusByTableName(string tableName, string colName, string selectedValue)
        {
            var keyValues = new Entities().Meta_KeyValue.Where(m => m.TableName == tableName && m.ColName == colName).ToList();

            return keyValues.Select(kv => new SelectListItem() {Text = kv.Text, Value = kv.Value, Selected = kv.Value == selectedValue}).OrderBy(m=>m.Value).ToList();
        }  
    }
}