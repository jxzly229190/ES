using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ES.Server.Startup))]
namespace ES.Server
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
