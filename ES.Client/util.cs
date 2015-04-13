using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICSharpCode.SharpZipLib.Zip;

namespace ES.Client
{
    public static class util
    {
        public static string GetSetting(string key)
        {
            return System.Configuration.ConfigurationManager.AppSettings[key];
        }

        public static void SetSetting(string key, string value)
        {
            if (string.IsNullOrEmpty(key))
            {
                throw new ArgumentNullException("key");
            }

            if (string.IsNullOrEmpty(value))
            {
                throw new ArgumentNullException("value");
            }

            System.Configuration.ConfigurationManager.AppSettings.Set(key,value);
        }

        /// <summary>
        /// 创建Zip压缩文件
        /// </summary>
        /// <param name="fileName">需要创建的文件名，包括“.zip"后缀。</param>
        /// <param name="directory">需要压缩的文件目录</param>
        /// <param name="recurse">是否循环压缩，如：@"C:\SourceDirectory"</param>
        /// /// <param name="filter">筛选字符串，如：@"\.txt$"; // Only files ending in ".txt"</param>
        public static void CreateZipFile(string fileName, string directory, bool recurse, string filter)
        {
            var fastZip = new FastZip();

            //bool recurse = true;  // Include all files by recursing through the directory structure
            //string filter = null; // Dont filter any files at all
            fastZip.CreateZip(fileName, directory, recurse, filter);
        }
        
        /// <summary>
        /// 解压Zip文件
        /// </summary>
        /// <param name="zipFileName">Zip文件名</param>
        /// <param name="targetDir">目的目录</param>
        /// <param name="fileFilter">筛选字符串</param>
        public static void UnpackZipFile(string zipFileName, string targetDir, string fileFilter)
        {

            var fastZip = new FastZip();
            //string fileFilter = null;

            // Will always overwrite if target filenames already exist
            fastZip.ExtractZip(zipFileName, targetDir, fileFilter);
        }
    }
}
