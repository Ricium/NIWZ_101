<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DeviceModel>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Devices
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Devices</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<DeviceModel>()
        .Name("Devices")
        .DataKeys(keys => keys.Add(s => s.DeviceReg))
                .Columns(columns =>
        {
            columns.Bound(m => m.DeviceReg);
            columns.Bound(m => m.SchoolId);
                  })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListDevices", "Notes");
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
