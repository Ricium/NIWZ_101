<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<SportCategory>" %>
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
        <tr><td><%: Html.HiddenFor(m=>m.SportCategoryID) %></td></tr>
        <tr>
            <td title="Enter the Category Name">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.CategoryName) %>
            </td>
            <td title="Enter the Sport Category Name">
                <%: Html.TextBoxFor(m => m.CategoryName) %>
                <%: Html.ValidationMessageFor(m => m.CategoryName) %>
            </td>
        </tr>
    

        </table>
    

</body>
</html>
