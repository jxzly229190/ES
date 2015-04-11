using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Mvc;

namespace ES.Server
{
    public class Tools
    {
        public static IList<SelectListItem> GetKeyValuesByTableColumn(string tableName, string colName, string selectedValue)
        {
            var keyValues = new Entities().Meta_KeyValue.Where(m => m.TableName == tableName && m.ColName == colName).ToList();

            return keyValues.Select(kv => new SelectListItem() {Text = kv.Text, Value = kv.Value, Selected = kv.Value == selectedValue}).OrderBy(m=>m.Value).ToList();
        }

        public static string GetSelectedTextByTableColumn(string tableName, string colName, string selectedValue)
        {
            var kvs =
                new Entities().Meta_KeyValue.Where(
                    m => m.TableName == tableName && m.ColName == colName && m.Value == selectedValue);
            if (kvs.Any())
            {
                return kvs.First().Text;
            }

            return null;
        }
    }
}