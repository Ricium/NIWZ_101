<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Schoolsc>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Schools</title>
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
            <td> <%:Html.HiddenFor(m => m.SchoolId) %></td>
                    <td><%:Html.HiddenFor(m => m.PictureId) %> </td>
          </tr>
        <tr>
            <td title="Enter the Title for the SchoolName">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.SchoolName) %>
            </td>
            <td title="Enter the Title for the SchoolName">
                <%: Html.TextBoxFor(m => m.SchoolName) %>
                <%: Html.ValidationMessageFor(m => m.SchoolName) %>
            </td>
        </tr>
  

        <tr>
            <td title="Enter the body for the News">
                <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Schoolabbreviation) %>
            </td>
            <td title="Enter the body for the Schoolabbreviation">
                <%: Html.TextBoxFor(m => m.Schoolabbreviation)%>
                <%: Html.ValidationMessageFor(m => m.Schoolabbreviation) %>
            </td>
        </tr>
        
        
        <tr>
            <td>
                Photo Upload
                </td>
            <td>          
<%= Html.Telerik().Upload()
            .Name("attachments")
            .Async(async => async
                .Save("Save", "Match")
                .Remove("Remove", "Match")              
            ).ClientEvents(c => c
                .OnSuccess("onSuccess")
            )
    %>    
    <p class="note">
        Maximum allowed file size: 5 MB
    </p>
            </td>
            
        </tr>
        </table>
    

</body>
</html>
