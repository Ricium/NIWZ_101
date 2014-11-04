<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Documents>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Document</title>
    <script type="text/javascript">
        function onSuccess(e) {
            $('#DocId').attr('value', e.response.status);
        }
    </script>
</head>
<body>
    <%: Html.ValidationSummary(false) %>

    <table>
        <tr>
        <td> <%:Html.HiddenFor(m => m.DocId) %></td>
            <td> <%:Html.HiddenFor(m => m.ClientId) %></td>
        </tr>
            <tr>
            <td>
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.DocumentName) %>
            </td>
            <td>
                <%: Html.TextBoxFor(m => m.DocumentName) %>
                <%: Html.ValidationMessageFor(m => m.DocumentName) %>
            </td>
        </tr>
        <tr>
            <td>
                Document Upload
                </td>
            <td>          
            <%= Html.Telerik().Upload()
                        .Name("attachments")
                        .Async(async => async
                            .Save("Save", "Document")
                        ).ClientEvents(c => c
                            .OnSuccess("onSuccess")
                        )
                %>    
            <p class="note">
                Maximum allowed file size: 10 MB
            </p>
            </td>
        </tr>
        </table>   

</body>
</html>
