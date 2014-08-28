<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<News>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>News</title>
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
            <td> <%:Html.HiddenFor(m => m.NewsId) %></td>
                    <td><%:Html.HiddenFor(m => m.PictureId) %> </td>
          </tr>
        <tr>
            <td title="Enter the Title for the News e.g. Rugby">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Title) %>
            </td>
            <td title="Enter the Title for the News e.g. Rugby">
                <%: Html.TextBoxFor(m => m.Title) %>
                <%: Html.ValidationMessageFor(m => m.Title) %>
            </td>
        </tr>
  

        <tr>
            <td title="Enter the body the News">
                <%: Html.LabelFor(m => m.Body) %>
            </td>
            <td title="Enter the body the News">
                <%: Html.TextAreaFor(m => m.Body) %>
                <%: Html.ValidationMessageFor(m => m.Body) %>
            </td>
        </tr>
        
        <tr>
            <td title="Select Category for the News e.g. Sport">
                <b Class=asteriks>*</b><%: Html.Label("Category") %>
            </td>
            <td  title="Select Category for the News e.g. Sport">
                <%= Html.Telerik().DropDownListFor(c => c.CategoryId).BindTo((IEnumerable<SelectListItem>)ViewData["Category"])
                .CascadeTo("SubCategoryId")%>
                <%: Html.ValidationMessageFor(m => m.CategoryId) %>
            </td>
        </tr>
        <tr>
            <td title="Select a subcategory for the announcement e.g. Rugby">
                <b Class=asteriks>*</b><%: Html.Label("Sub Category") %>
            </td>
            <td title="Select a subcategory for the announcement e.g. Rugby">
                <%= Html.Telerik().DropDownListFor(c => c.SubCategoryId)
                .DataBinding(binding => binding.Ajax().Select("_AsyncSubCategory", "News")).SelectedIndex(0)%>
                <%: Html.ValidationMessageFor(m => m.SubCategoryId) %>
            </td>
             <td style="vertical-align:bottom; text-align:right">
                                <b class="asteriks">*</b> Shows Required Field
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
                .Save("Save", "News")
                .Remove("Remove", "News")              
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
