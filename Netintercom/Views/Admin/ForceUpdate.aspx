<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SportCategoryID>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   Force Update
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Force Update</h3>
   <% using (Html.BeginForm("DoForceUpdate", "Admin", FormMethod.Post))
       { %>
        <table>
            <tr>
                                <td>
                    Select Client:
                </td>
                <td>
                    <%: Html.Telerik().DropDownListFor(m => m.SportCategory).BindTo(ViewData["Clients"]  as IEnumerable<SelectListItem>) %>
                </td>
            </tr>
        </table>
       <button type="submit" class="t-button">Force Update</button>      
    <% } %>

</asp:Content>