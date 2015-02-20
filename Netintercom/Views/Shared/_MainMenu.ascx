<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%  
    Html.Telerik()
        .Menu()
        .Name("Menu")
        .Effects(fx =>
        {
            fx.Slide();
        })
        .Items(items =>
        {
            if (HttpContext.Current.User.IsInRole("client")) {
                items.Add()
                     .Text("Home")
                     .Url("~/Home/Home");
            }
            
            if (HttpContext.Current.User.IsInRole("admin"))
            {
                items.Add()
                         .Text("Clients")
                         .Url("~/Admin/RegisterSchool");
                items.Add()
                         .Text("Users")
                         .Url("~/Admin/RegisterUser");
                items.Add()
                           .Text("Devices")
                           .Url("~/Admin/Devices");
                items.Add()
                        .Text("Client Settings")
                        .Url("~/Settings/Settings");
                items.Add()
                    .Text("Nuclear")
                    .Url("~/Admin/Skwladaptor");
            }

            if (HttpContext.Current.User.IsInRole("deviceusers"))
            {
                items.Add()
                    .Text("Users")
                    .Url("~/DeviceUser/DeviceUsers");
            }

            if (HttpContext.Current.User.IsInRole("documents"))
            {
                items.Add()
                    .Text("Documents")
                    .Url("~/Document/Documents");
            }

            if (HttpContext.Current.User.IsInRole("services"))
            {
                items.Add()
                    .Text("Services")
                    .Url("~/Services/Services");
            }

            if (HttpContext.Current.User.IsInRole("news"))
            {
                items.Add()
                      .Text("News")
                      .Url("~/News/News");
            }

            if (HttpContext.Current.User.IsInRole("events"))
            {
                items.Add()
                     .Text("Events")
                     .Url("~/Events/Events");
            }

            if (HttpContext.Current.User.IsInRole("notifications"))
            {
                items.Add()
                       .Text("Notifications")
                       .Url("~/Notifications/Announcements");
            }

            if (HttpContext.Current.User.IsInRole("advertisements"))
            {
                items.Add()
                         .Text("Advertisements")
                         .Url("~/ProAd/ProAd");
            }

            if (HttpContext.Current.User.IsInRole("contacts"))
            {
                items.Add()
                     .Text("Contact Details")
                     .Url("~/Home/Contact");
            }
            if (HttpContext.Current.User.IsInRole("contacts"))
            {
                items.Add()
                     .Text("Fields")
                     .Url("~/Match/Fields");
            }
            if (HttpContext.Current.User.IsInRole("contacts"))
            {
                items.Add()
                     .Text("Match")
                     .Url("~/Home/Contact")
                     .Items(m =>
                     {
                         m.Add().Text("Fields").Url("~/Match/Fields");
                     });
            }
            
            
            if (HttpContext.Current.User.IsInRole("facebook") || HttpContext.Current.User.IsInRole("email") || HttpContext.Current.User.IsInRole("twitter") || HttpContext.Current.User.IsInRole("sms"))
            {
                items.Add()
                     .Text("My Settings")
                     .Url("~/Settings/MySettings");
            }  
                    
            items.Add()
                  .Text("Log Off")
                  .Url("~/Account/LogOff");          
        })
        .Render();
%>