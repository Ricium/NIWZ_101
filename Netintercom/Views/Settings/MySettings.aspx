<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Settings>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Services
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>My Settings</h2>

    <table>
        <% if (HttpContext.Current.User.IsInRole("facebook")) { %>
        <tr>
            <td>
                Facebook
            </td>
            <td>
                <% if (ViewBag.Facebook == "Yes") { %>
                Your Facebook account has been authenticated
                <% } else { %>
                Please authenticate your Facebook account: <%: Html.ActionLink("Login with Facebook","FacebookLogin","Settings") %>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>
