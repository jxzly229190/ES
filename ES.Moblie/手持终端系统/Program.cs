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
                MessageBox.Show("������Ĳ���ʹ�����ѵ�����������ṩ����ϵ��");
                return;
            }
			Application.Run(new FrmLogin());
		}
	}
}
