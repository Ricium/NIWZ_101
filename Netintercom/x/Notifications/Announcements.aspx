<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="SchoolIntercom"%>
<%@ Import Namespace="SchoolIntercom.Models"%>
<%@ Import Namespace="SchoolIntercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Announcements
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Announcements</h2>

    <table>
        <tr>
            <td>
 <%  Html.Telerik().Grid<Notifications>()
        .Name("Announcements")
        .DataKeys(keys => keys.Add(s => s.NotificationsId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(GridButtonType.ImageAndText).Text("Add New Announcement"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.NotificationsId).Title("Announcements");
            columns.Bound(m => m.Title);
            columns.Bound(m => m.Body).Title("Announcement");
            columns.Bound(m => m.PostDate);             
                            columns.Command(commands =>
                            {
                                commands.Delete().ButtonType(GridButtonType.ImageAndText).Text("Remove Announcement");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListNotifications", "Notifications")
                       .Insert("_InsertNotifications", "Notifications")
                       .Update("_UpdateNotifications", "Notifications")
                       .Delete("_DeleteNotifications", "Notifications"); 
        })
       
        .Pageable(paging => paging.PageSize(50))
        .Sortable()
        .Scrollable(scrolling => scrolling.Height(250))
        .Filterable()
        .Editable(editing => editing.Mode(GridEditMode.PopUp).InsertRowPosition(GridInsertRowPosition.Top))
        .Render(); %>
            </td>
        </tr>
    </table>
</asp:Content>
