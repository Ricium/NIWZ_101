<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Results>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Results
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Results</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Results>()
        .Name("Result")
        .DataKeys(keys => keys.Add(s => s.ResultsId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Results"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.ResultsId).Title("Results");
            columns.Bound(m => m.ResultsId);
            columns.Bound(m => m.field);
            columns.Bound(m => m.fixtures);
            columns.Bound(m => m.TimeInMatch);
            columns.Bound(m => m.TeamA);
            columns.Bound(m => m.PointsA);
            columns.Bound(m => m.TeamB);
            columns.Bound(m => m.PointsB);
           
                            columns.Command(commands =>
                            {   
                                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Results");
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Results");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListResults", "Match")
                       .Insert("_InsertResults", "Match")
                       .Update("_UpdateResults", "Match")
                       .Delete("_DeleteResults", "Match"); 
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
