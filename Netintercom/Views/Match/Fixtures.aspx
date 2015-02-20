<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Fixtures>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Fixtures
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Fixtures</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Fixtures>()
        .Name("Fixture")
        .DataKeys(keys => keys.Add(s => s.FixturesId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Fixtures"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.FixturesId).Title("Fixtures");
            columns.Bound(m => m.FixturesId);
            columns.Bound(m => m.field);
            columns.Bound(m => m.TeamIdA);
            columns.Bound(m => m.TeamIdB);
            columns.Bound(m => m.StartTime);
                            columns.Command(commands =>
                            {   
                                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Fixtures");
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Fixtures");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListFixtures", "Fixtures")
                       .Insert("_InsertFixtures", "Fixtures")
                       .Update("_UpdateFixtures", "Fixtures")
                       .Delete("_DeleteFixtures", "Fixtures"); 
        })
       
        .Pageable(paging => paging.PageSize(50))
        .Sortable()
        .Scrollable(scrolling => scrolling.Height(250))
        .Filterable()
        .Editable(editing => editing.Mode(Telerik.Web.Mvc.UI.GridEditMode.PopUp).InsertRowPosition(Telerik.Web.Mvc.UI.GridInsertRowPosition.Top))
        .Render(); %>
            </td>
        </tr>
    </table>
</asp:Content>
