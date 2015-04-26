using System;
using System.IO;
using System.Reflection;
namespace DataFactory
{
	public static class GetConn
	{
		public static string Conn(out string result)
		{
			string result2;
			try
			{
				string text = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase.ToString()) + "\\AppCode.txt";
				if (text.StartsWith("file:"))
				{
					text = text.Substring(6);
				}
				using (StreamReader streamReader = File.OpenText(text))
				{
					string text2 = streamReader.ReadLine();
					if (string.IsNullOrEmpty(text2))
					{
						result = "配置文件无内容，请设置数据库参数！";
						result2 = "";
					}
					else
					{
						result = "";
						result2 = text2;
					}
				}
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "";
			}
			return result2;
		}
		public static string Update(out string result)
		{
			string result2;
			try
			{
				string text = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase.ToString()) + "\\update.txt";
				if (text.StartsWith("file:"))
				{
					text = text.Substring(6);
				}
				using (StreamReader streamReader = File.OpenText(text))
				{
					string text2 = streamReader.ReadLine();
					if (string.IsNullOrEmpty(text2))
					{
						result = "";
						result2 = "";
					}
					else
					{
						result = "";
						result2 = text2;
					}
				}
			}
			catch (Exception ex)
			{
				result = ex.Message;
				result2 = "";
			}
			return result2;
		}
	}
}
