using System;
using System.ComponentModel;
using System.Globalization;
using System.Resources;
namespace WindowsMobile.Properties
{
	internal class Resources
	{
		private static ResourceManager _resMgr;
		private static CultureInfo _resCulture;
		[EditorBrowsable]
		public static ResourceManager ResourceManager
		{
			get
			{
				if (Resources._resMgr == null)
				{
					ResourceManager resMgr = new ResourceManager("WindowsMobile.Properties.Resources", typeof(Resources).Assembly);
					Resources._resMgr = resMgr;
				}
				return Resources._resMgr;
			}
		}
		[EditorBrowsable]
		public static CultureInfo Culture
		{
			get
			{
				return Resources._resCulture;
			}
			set
			{
				Resources._resCulture = value;
			}
		}
		internal Resources()
		{
		}
	}
}
