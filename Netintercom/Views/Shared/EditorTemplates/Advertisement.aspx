<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Advertisement>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Advertisement</title>
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
        <td> <%:Html.HiddenFor(m => m.AdvertisementId) %></td>
            <td> <%:Html.HiddenFor(m => m.ClientId) %> <%:Html.HiddenFor(m => m.PictureId) %></td>
        </tr>
            <tr>
            <td>
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Title) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.Title) %>
                <%: Html.ValidationMessageFor(m => m.Title) %>
            </td>
        </tr>
        <tr>
            <td>
                <%: Html.LabelFor(m => m.Body) %>
            </td>
            <td>
                <%: Html.TextAreaFor(m => m.Body, new { Cols = 50, Rows = 10 }) %>
                <%: Html.ValidationMessageFor(m => m.Body) %>
            </td>
        </tr>
         <tr>
            <td>
               <%: Html.LabelFor(m => m.Number) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.Number) %>
                <%: Html.ValidationMessageFor(m => m.Number) %>
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
                <%: Html.LabelFor(m => m.WebSiteUrl) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.WebSiteUrl) %>
                <%: Html.ValidationMessageFor(m => m.WebSiteUrl) %>
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
                .Save("Save", "ProAd")
                .Remove("Remove", "ProAd")              
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
