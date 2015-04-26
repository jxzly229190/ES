using System;
using System.Windows.Forms;
namespace WindowsMobile
{
	internal static class Program
	{
		[MTAThread]
		private static void Main()
		{
            DateTime OriDateTime = new DateTime(2015, 5, 1);
            if ((DateTime.Today - OriDateTime).Days > 30)
            {
                MessageBox.Show("此软件的测试使用期已到，请与软件提供商联系。");
                return;
            }
			Application.Run(new FrmLogin());
		}
	}
}
