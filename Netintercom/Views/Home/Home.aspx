<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Stats>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>Welcome: <%: Html.DisplayFor(m => m.Username) %></h2>
    <table style="border:solid">
        <tr style="vertical-align:top">
            <td style="border:solid; width:400px">
                <table>
                    <tr>
                        <td colspan="2"><h3>Here is you current statistics:</h3></td>
                    </tr>
                    <% if (HttpContext.Current.User.IsInRole("deviceusers")) { %>
                   <tr>
                       <td>
                           You currently have: 
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.Users) %></b> user(s) active.
                       </td>
                   </tr>
                    <% } %>
                    <% if (HttpContext.Current.User.IsInRole("news")) { %>
                   <tr>
                       <td>
                           You sent out: 
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.News) %></b> news items.
                       </td>
                   </tr>
                    <% } %>
                    <% if (HttpContext.Current.User.IsInRole("events")) { %>
                   <tr>
                       <td>
                           You created:
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.Events) %></b> events.
                       </td>
                   </tr>
                    <% } %>
                   <tr>
                       <td>
                           You sent
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.Notifications) %></b> notifications.
                       </td>
                   </tr>
                    <% if (HttpContext.Current.User.IsInRole("advertisements")) { %>
                   <tr>
                       <td>
                           You have:
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.Ads) %></b> advertisements loaded on the app.
                       </td>
                   </tr>  
                    <% } %>                 
                </table>
            </td>
            <% if (HttpContext.Current.User.IsInRole("services")) { %>
            <td style="border:solid; width:400px">
                <table>
                    <tr>
                       <td colspan="2"><h3>These are your services:</h3></td>
                   </tr>
                    <tr>
                        <td>
                            Service
                        </td>
                        <td>
                        </td>
                    </tr>
                   <% for (int i = 0; i < Model.Services.Count(); i++ )
                      {%>
                   <tr>
                       <td>
                           <%: Html.DisplayFor(m => m.Services[i])%>
                       </td>
                       <td>
                           <b><%: Html.DisplayFor(m => m.ServiceCounts[i])%></b> times used
                       </td>
                   </tr>
                   <% } %>
                </table>
            </td>
        <% } %>
        </tr>
    </table>
       
        
</div>
</asp:Content>
