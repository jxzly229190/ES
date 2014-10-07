using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ES.Repository.Model
{
    public class ResponseData
    {
        public int State { get; set; }

        public string Message { get; set; }

		public object data { get;set;}        
    }

	public class SqlData
	{
		public string HeaderSql { get; set; }

		public string DetailSql { get; set; }

		public string FooterSql { get; set; }

		public int RowCount { get; set; }

		public string MaxTimeStamp { get; set; }
	}
}
