<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% if (HttpContext.Current.User.IsInRole("Client")) { %>
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
            items.Add()
                 .Text("Home")
                 .Url("~/Home/Index");
            items.Add()
                  .Text("News")
                  .Url("~/News/News");
            items.Add()
                 .Text("Events")
                 .Url("~/Events/Events");
            items.Add()
                   .Text("Announcements")
                   .Url("~/Notifications/Announcements");
            items.Add()
                     .Text("Advertisements")
                     .Url("~/Advertisement/Advertisement");
            items.Add()
                 .Text("Contact Details")
                 .Url("~/Home/Contact");
            items.Add()
                  .Text("Log Off")
                  .Url("~/Account/LogOff");          
        })
        .Render();
%>
<% }
   else if (HttpContext.Current.User.IsInRole("Admin"))
   { %>
<%  Html.Telerik()
        .Menu()
        .Name("Menu")
        .Effects(fx =>
        {
            fx.Slide();
        })
        .Items(items =>
        {
            items.Add()
                     .Text("Admin School")
                     .Url("~/Admin/RegisterSchool");
              items.Add()
                       .Text("Admin User")
                       .Url("~/Admin/RegisterUser");
              items.Add()
                         .Text("Admin Device")
                         .Url("~/Admin/Devices");
              items.Add()
                      .Text("Notes")
                      .Url("Notes/Notes");
              items.Add()
                    .Text("Log Off")
                    .Url("~/Account/LogOff");  
        })
        .Render();
%>
    
<% } %>