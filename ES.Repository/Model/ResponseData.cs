﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace ES.Repository.Model
{
	[XmlInclude(typeof(ResponseData))]
    public class ResponseData
    {
        public int State { get; set; }

        public string Message { get; set; }

        public long MaxStamp { get; set; }

		public object data { get;set;}
    }

    public class SqlData
	{
		public string ConfigGuid { get;set;}

		public string HeaderSql { get; set; }

		public string DetailSql { get; set; }

		public string FooterSql { get; set; }

		public int RowCount { get; set; }

		public long MaxTMstamp { get; set; }

        public List<BlobData> BlobDatas { get; set; }
	}

	public class QueryResult {
		public string sql { get;set;}
		public long stamp { get;set;}
	    public Guid Guid { get; set; }
        public byte[] Blob { get; set; }
	}
}
