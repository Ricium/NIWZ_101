<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Teams>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Teams</title>

</head>

<body>
    <%: Html.ValidationSummary(false) %>
    <table> 
         <tr> <td> <%: Html.HiddenFor(m => m.TeamsId) %></td>
                        <td><%:Html.HiddenFor(m => m.ClientId) %> </td>
             </tr>
                                                        <tr>
                        <td>
                           <%: Html.LabelFor(m => m.SchoolId)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.SchoolId).BindTo((IEnumerable<SelectListItem>) ViewData["SchoolId"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.SchoolId) %>
                        </td>
                    </tr> 
        <tr>

            <td title="Enter the Team Age">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Age) %>
            </td>
            <td title="Enter the Field Age">
                <%: Html.TextBoxFor(m => m.Age) %>
                <%: Html.ValidationMessageFor(m => m.Age) %>
            </td>
        </tr>

                                        <tr>
                        <td>
                           <%: Html.LabelFor(m => m.Ranks)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.Ranks).BindTo((IEnumerable<SelectListItem>) ViewData["Ranks"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.Ranks) %>
                        </td>
                    </tr> 
                                                <tr>
                        <td>
                           <%: Html.LabelFor(m => m.sportcategory)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.SportCategoryID).BindTo((IEnumerable<SelectListItem>) ViewData["SportCategoryID"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.SportCategoryID) %>
                        </td>
                    </tr> 


        </table>
    

</body>
</html>
