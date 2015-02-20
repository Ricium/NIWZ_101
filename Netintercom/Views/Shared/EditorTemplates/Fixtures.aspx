<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Fixtures>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Contact</title>
</head>
<body>
    <%: Html.ValidationSummary(false) %>
    <table>
                    <tr>
                        <td>
                           <%: Html.LabelFor(m => m.FieldId)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.FieldId).BindTo((IEnumerable<SelectListItem>) ViewData["FieldId"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.FieldId) %>
                        </td>
                    </tr> 

                    <tr>
                        <td>
                           <%: Html.LabelFor(m => m.TeamIdA)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.TeamIdA).BindTo((IEnumerable<SelectListItem>) ViewData["TeamIdA"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.TeamIdA) %>
                        </td>
                    </tr> 
                            <tr>
                        <td>
                           <%: Html.LabelFor(m => m.TeamIdB)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DropDownListFor(m => m.TeamIdB).BindTo((IEnumerable<SelectListItem>) ViewData["TeamIdB"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.TeamIdB) %>
                        </td>
                    </tr>


                                        <tr>
                        <td>
                           <%: Html.LabelFor(m => m.StartTime)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DateTimePickerFor(m => m.StartTime)%>
                            <%: Html.ValidationMessageFor(model => model.StartTime) %>
                        </td>
                    </tr> 

        </table>
    

</body>
</html>
