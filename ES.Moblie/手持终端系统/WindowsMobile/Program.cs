namespace WindowsMobile
{
    using System;
    using System.Windows.Forms;

    internal static class Program
    {
        [MTAThread]
        private static void Main()
        {
            Application.Run(new FrmLogin());
        }
    }
}

