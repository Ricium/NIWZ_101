<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Contact>" %>
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
            <td title="Enter the Contact Name ">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Name) %>
            </td>
            <td title="Enter the Contact Name">
                <%: Html.TextBoxFor(m => m.Name) %>
                <%: Html.ValidationMessageFor(m => m.Name) %>
            </td>
        </tr>
  
        <tr>
            <td title="Enter the Contact Surname ">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Surname) %>
            </td>
            <td title="Enter the Contact Surname">
                <%: Html.TextBoxFor(m => m.Surname) %>
                <%: Html.ValidationMessageFor(m => m.Surname) %>
            </td>
        </tr>
        
        <tr>
            <td title="Enter the Contact Number ">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Number) %>
            </td>
            <td title="Enter the Contact Number">
                <%: Html.TextBoxFor(m => m.Number) %>
                <%: Html.ValidationMessageFor(m => m.Number) %>
            </td>
        </tr>
         <tr>
            <td title="Enter the Contact Email ">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Email) %>
            </td>
            <td title="Enter the Contact Email">
                <%: Html.TextBoxFor(m => m.Email) %>
                <%: Html.ValidationMessageFor(m => m.Email) %>
            </td>
        </tr>
           <tr>
            <td title="Enter the Contact Description ">
               <b Class=asteriks>*</b> <%: Html.Label("Description") %>
            </td>
            <td title="Enter the Contact Description">
                <%: Html.TextAreaFor(m => m.Body) %>
                <%: Html.ValidationMessageFor(m => m.Body) %>
            </td>
        </tr>
        <tr>
            <td><%:Html.HiddenFor(m => m.ClientId) %> </td>
            <td> <%:Html.HiddenFor(m => m.ContactId) %></td>
        </tr>
        </table>
    

</body>
</html>
