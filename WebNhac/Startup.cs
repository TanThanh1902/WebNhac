using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebNhac.Startup))]
namespace WebNhac
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
