<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Fields>" %>
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
        <tr><td><%: Html.HiddenFor(m=>m.FieldsId) %></td></tr>
               <tr>
            <td>
                <%: Html.LabelFor(m => m.sportcategory) %>
            </td>
         
                     <td>
                           <%: Html.Telerik().DropDownListFor(m => m.SportCategoryID).BindTo((IEnumerable<SelectListItem>) ViewData["SportCategoryID"]).HtmlAttributes(new { style = "width: 250px" })%>
                            <%: Html.ValidationMessageFor(model => model.SportCategoryID) %>
                        </td>
           
        </tr>
         <tr>
            <td title="Enter the Field Name ">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.FieldName) %>
            </td>
            <td title="Enter the Field Name">
                <%: Html.TextBoxFor(m => m.FieldName) %>
                <%: Html.ValidationMessageFor(m => m.FieldName) %>
            </td>
        </tr>

  

        </table>
    

</body>
</html>
