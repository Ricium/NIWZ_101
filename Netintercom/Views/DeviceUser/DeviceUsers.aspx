<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DeviceUser>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Device Users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Device Users</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<DeviceUser>()
        .Name("DeviceUsers")
        .DataKeys(keys => keys.Add(s => s.DeviceUserId))
        .Columns(columns =>
        {
            columns.Bound(m => m.Name);
            columns.Bound(m => m.Surname);
            columns.Bound(m => m.Phone);
            columns.Bound(m => m.Email);
            columns.Add(c => c.Approved);
            columns.Command(commands =>
            {
                commands.Custom("ApproveUser").Action("_ApproveUser", "DeviceUser").ButtonType(Telerik.Web.Mvc.UI.GridButtonType.Text).Text("Approve User");
                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove User");
            }).Title("");        
            
        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListDeviceUsers", "DeviceUser")
                       .Delete("_RemoveDeviceUsers", "DeviceUser");
        })
       
        .Pageable(paging => paging.PageSize(50))
        .Sortable()
        .Scrollable(scrolling => scrolling.Height(250))
        .Filterable()
        .Render(); %>
            </td>
        </tr>
    </table>
</asp:Content>
