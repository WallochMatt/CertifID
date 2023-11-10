using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.IO;

[assembly: FunctionsStartup(typeof(CertifID.Startup))]

namespace CertifID
{
    public class Startup : FunctionsStartup
    {
        private IConfiguration _configuration;

        private string GetAppSetting(string name)
        {
            return _configuration[name] ?? _configuration[$"Values:{name}"];
        }
        public override void ConfigureAppConfiguration(IFunctionsConfigurationBuilder builder)
        {
            var env = builder.GetContext();
            builder.ConfigurationBuilder
                .SetBasePath(builder.GetContext().ApplicationRootPath)
                .AddJsonFile("local.settings.json", optional: true, reloadOnChange: true)
                .AddJsonFile(Path.Combine(env.ApplicationRootPath, $"appsettings.{env.EnvironmentName}.json"), optional: true, reloadOnChange: false)
                .AddEnvironmentVariables()
                .Build();
        }
        public override void Configure(IFunctionsHostBuilder builder)
        {
            _configuration = builder.GetContext().Configuration;

            var rootFolder = GetAppSetting("RootFolder");
            builder.Services.AddSingleton(rootFolder);
        }

    }
}
