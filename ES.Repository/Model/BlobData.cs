using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SqlServer.Server;

namespace ES.Repository.Model
{
    public class BlobData
    {
        public Guid Guid { get; set; }

        public byte[] Blob { get; set; }
    }
}
