<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Services>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Services
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Services</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Services>()
        .Name("Services")
        .DataKeys(keys => keys.Add(s => s.ServiceId))
        .Columns(columns =>
        {
            columns.Bound(m => m.UserName);
            columns.Bound(m => m.Phone);
            columns.Bound(m => m.Email);
            columns.Bound(m => m.Service);
            columns.Bound(m => m.Query);
            columns.Bound(m => m.ModifiedDate);         
            
        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListServices", "Services"); 
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
