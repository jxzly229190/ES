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

        public static List<SelectListItem> GetTableList()
        {
            var tables =
                new Entities().Database.SqlQuery<string>(
                    "select Table_Name from INFORMATION_SCHEMA.TABLES Where TABLE_NAME not like 'AspNet%' And TABLE_NAME <>'__MigrationHistory'");
            if (tables.Any())
            {
                var TableNames = new List<SelectListItem>();
                TableNames.Add(new SelectListItem() { Text = "--请选择--", Value = "" });
                foreach (var table in tables)
                {
                    TableNames.Add(new SelectListItem() { Text = table, Value = table });
                }

                return TableNames;
            }

            return null;
        }
    }
}