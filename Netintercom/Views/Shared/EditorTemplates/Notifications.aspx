<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Notifications>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Announcements</title>
</head>
<body>
    <%: Html.ValidationSummary(false) %>

    <table>
            <td><%:Html.HiddenFor(m => m.ClientId) %> </td>
            <td> <%:Html.HiddenFor(m => m.NotificationsId) %></td>
               
          
        <tr>
            <td title="Enter the Title for the Notifications e.g. Rugby">
               <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.Title) %>
            </td>
            <td title="Enter the Title for the Notifications e.g. Rugby">
                <%: Html.TextBoxFor(m => m.Title) %>
                <%: Html.ValidationMessageFor(m => m.Title) %>
            </td>
        </tr>
  

        <tr>
            <td title="Enter the body the Notifications">
                <%: Html.LabelFor(m => m.Body) %>
            </td>
            <td title="Enter the body the Notifications">
                <%: Html.TextAreaFor(m => m.Body, new { Cols = 50, Rows = 10 }) %>
                <%: Html.ValidationMessageFor(m => m.Body) %>
            </td>
        </tr>
        
        <tr>
            <td title="Select Category for the Notifications e.g. Sport">
                <b Class=asteriks>*</b><%: Html.Label("Category") %>
            </td>
            <td  title="Select Category for the Notifications e.g. Sport">
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
                .DataBinding(binding => binding.Ajax().Select("_AsyncSubCategorys", "Notifications"))%>
                <%: Html.ValidationMessageFor(m => m.SubCategoryId) %>
            </td>
             <td style="vertical-align:bottom; text-align:right">
                                <b class="asteriks">*</b> Shows Required Field
                            </td>
        </tr>
        </table>
    

</body>
</html>
