<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="SchoolIntercom"%>
<%@ Import Namespace="SchoolIntercom.Models"%>
<%@ Import Namespace="SchoolIntercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Register Users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Register User</h2>

    <table>
        <tr>
            <td>
     <% Html.Telerik().Grid<RegisterModel>()
        .Name("Users")
        .DataKeys(keys => keys.Add(s => s.ClientId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(GridButtonType.ImageAndText))
        .Columns(columns =>
        {
            columns.Bound(m => m.UserId);
            columns.Bound(m => m.UserName);
            columns.Bound(m => m.Email);
            columns.Bound(m => m.LastLogin);
            columns.Bound(m => m.Locked);
            columns.Bound(m => m.Approved);
        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                        .Select("_ListUser", "Admin")
                       .Insert("_InsertUser", "Admin"); 
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
