using System;
namespace DataFactory
{
	public class User
	{
		public static string sysUser;
		public static string checkNo;
		public string SysUser
		{
			get
			{
				return User.sysUser;
			}
			set
			{
				User.sysUser = value;
			}
		}
		public string CheckNo
		{
			get
			{
				return User.checkNo;
			}
			set
			{
				User.checkNo = value;
			}
		}
	}
}
