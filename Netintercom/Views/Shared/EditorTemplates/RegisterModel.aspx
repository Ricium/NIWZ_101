<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<RegisterModel>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Register User</title>
</head>
<body>
    <%: Html.ValidationSummary(false) %>

    <table>
        <tr><td><%:Html.HiddenFor(m => m.UserId) %> </td><td></td><td></td></tr>                          
          
        <tr>
            <td>
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.FirstName) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.FirstName) %>
                <%: Html.ValidationMessageFor(m => m.FirstName) %>
            </td>
        </tr> 

        <tr>
            <td>
                <%: Html.LabelFor(m => m.Surname) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.Surname) %>
                <%: Html.ValidationMessageFor(m => m.Surname) %>
            </td>
        </tr>
        
        <tr>
            <td>
                <%: Html.LabelFor(m => m.UserName) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.UserName) %>
                <%: Html.ValidationMessageFor(m => m.UserName) %>
            </td>
        </tr>

        <tr>
            <td>
                <%: Html.LabelFor(m => m.Email) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </td>
        </tr>
        
        <tr>
            <td>
                <%: Html.LabelFor(m => m.Password) %>
            </td>
            <td>
                <%: Html.PasswordFor(m => m.Password) %>
                <%: Html.ValidationMessageFor(m => m.Password) %>
            </td>
        </tr>

        <tr>
            <td>
                <%: Html.LabelFor(m => m.ConfirmPassword) %>
            </td>
            <td>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
            </td>
        </tr>

        <tr>
            <td>
                <%: Html.LabelFor(m => m.ClientId) %>
            </td>
            <td>
                <%: Html.Telerik().DropDownListFor(m => m.ClientId).BindTo((IEnumerable<SelectListItem>)ViewData["Schools"]) %>
                <%: Html.ValidationMessageFor(m => m.ClientId) %>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(m => m.roleName) %>
            </td>
            <td>
                <%: Html.Telerik().DropDownListFor(m => m.roleName).BindTo((IEnumerable<SelectListItem>)ViewData["roleNames"]) %>
                <%: Html.ValidationMessageFor(m => m.roleName) %>
            </td>
        </tr>
        </table>
    

</body>
</html>
