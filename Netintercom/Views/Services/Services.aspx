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
            columns.Bound(m => m.UserName).Width(100);
            columns.Bound(m => m.Phone).Width(50);
            columns.Bound(m => m.Email).Width(80);
            columns.Bound(m => m.Service).Width(80);

            columns.Bound(m => m.Query).Width(200).ClientTemplate("<a href='<#= Query #>' target=new><#= Query #></a>");
            columns.Bound(m => m.ModifiedDate).Width(100);         
            
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
