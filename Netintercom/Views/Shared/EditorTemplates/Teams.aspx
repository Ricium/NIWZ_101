<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Teams>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Contact</title>
            <script type="text/javascript">
                function onSuccess(e) {
                    $('#PictureId').attr('value', e.response.status);
                }
    </script>
</head>

<body>
    <%: Html.ValidationSummary(false) %>
    <table> 
         <tr> <td> <%: Html.HiddenFor(m => m.TeamsId) %></td>
                    <td><%:Html.HiddenFor(m => m.PictureId) %> </td>
                        <td><%:Html.HiddenFor(m => m.ClientId) %> </td>
             </tr>
        <tr>
            <td title="Enter the Team Name ">
             
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Name) %>
            </td>
            <td title="Enter the Field Name">
                <%: Html.TextBoxFor(m => m.Name) %>
                <%: Html.ValidationMessageFor(m => m.Name) %>
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
