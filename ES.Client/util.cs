using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
    }
}
