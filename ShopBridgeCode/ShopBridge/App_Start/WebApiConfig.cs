using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Unity;
using Unity.Lifetime;
using ShopBridge.Services;
using ShopBridge.Controllers;

namespace ShopBridge
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            //var container = new UnityContainer();
            //container.RegisterType<IDbOpsService, DbOpsService>(new HierarchicalLifetimeManager());
            //config.DependencyResolver = new HomeApiController(container);

            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
