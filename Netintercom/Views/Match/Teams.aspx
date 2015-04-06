<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Teams>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Teams
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Teams</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Teams>()
        .Name("Team")
        .DataKeys(keys => keys.Add(s => s.TeamsId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Teams"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.TeamsId).Title("Teams");
            columns.Bound(m => m.TeamsId);
            columns.Bound(m => m.Name);
            columns.Bound(m => m.Age);
            columns.Bound(m => m.Ranks);
            columns.Bound(m => m.sportcategory);
            columns.Bound(c => c.PictureId)
                .ClientTemplate("<# if (PictureId == 0) { #> No Picture <# } else { #> <img alt='<#= PictureId #>' src='"
                    + Url.Content("<#= PicUrl #>")
                    + "' width='50px' height='50px'/> <# } #>")
                .Title("Picture");
            
                            columns.Command(commands =>
                            {   
                                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Teams");
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Teams");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListTeams", "Match")
                       .Insert("_InsertTeams", "Match")
                       .Update("_UpdateTeams", "Match")
                       .Delete("_DeleteTeams", "Match"); 
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
