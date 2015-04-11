using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ES.Repository
{
    public class Common
    {
        public const string PublicKey = "123456";

        public static string MD5(string str)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            return BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(str.ToLower())));
        }
    }
}
