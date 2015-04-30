<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SportCategoryID>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   Report
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Fixtures Report</h3>
   <% using (Html.BeginForm("GetFixtureReport", "Match", FormMethod.Post))
       { %>
        <table>
            <tr>
                                <td>
                    Select SportCategory Type:
                </td>
                <td>
                    <%: Html.Telerik().DropDownListFor(m => m.SportCategory).BindTo(ViewData["SportCategoryID"]  as IEnumerable<SelectListItem>) %>
                </td>
            </tr>
            <tr>
                                            <td>
                    Select FixtureDate:
                </td>
                <td>
                    <%: Html.Telerik().DatePickerFor(m => m.Date)%>
                </td>
            </tr>
        </table>
       <button type="submit" class="t-button">Get Report</button>      
    <% } %>

</asp:Content>