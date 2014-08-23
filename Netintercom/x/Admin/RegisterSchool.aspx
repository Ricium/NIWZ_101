<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Client>" %>
<%@ Import Namespace="SchoolIntercom"%>
<%@ Import Namespace="SchoolIntercom.Models"%>
<%@ Import Namespace="SchoolIntercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SchoolReg
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>SchoolReg</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Client>()
        .Name("Client")
        .DataKeys(keys => keys.Add(s => s.ClientId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(GridButtonType.ImageAndText))
        .Columns(columns =>
        {
            columns.Bound(m => m.ClientId).Title("SchoolReg");
            columns.Bound(m => m.Name);
                
                            columns.Command(commands =>
                            {
                                commands.Edit().ButtonType(GridButtonType.ImageAndText);
                                commands.Delete().ButtonType(GridButtonType.ImageAndText);
                            }).Title("Commands");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListClient", "Admin")
                       .Insert("_InsertClient", "Admin")
                       .Update("_UpdateClient", "Admin")
                       .Delete("_DeleteClient", "Admin"); 
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
