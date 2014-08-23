<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Client>" %>
<%@ Import Namespace="SchoolIntercom"%>
<%@ Import Namespace="SchoolIntercom.Models"%>
<%@ Import Namespace="SchoolIntercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Client</title>
    <script type="text/javascript">
        function onSuccess(e) {
            $('#PictureId').attr('value', e.response.status);
        }
    </script>
</head>
<body>
    <%: Html.ValidationSummary(false) %>

    <table>
        <tr>
            <td><%:Html.HiddenFor(m => m.ClientId) %> </td>
            <td> <%:Html.HiddenFor(m => m.ClientId) %></td>
                   
          </tr>
        <tr>
            <td title="Enter the Title for the Client e.g. Rugby">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Name) %>
            </td>
            <td title="Enter the Title for the Client e.g. Rugby">
                <%: Html.TextBoxFor(m => m.Name) %>
                <%: Html.ValidationMessageFor(m => m.Name) %>
            </td>
        </tr>   
        </table>
    

</body>
</html>
