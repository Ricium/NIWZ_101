<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="SchoolIntercom"%>
<%@ Import Namespace="SchoolIntercom.Models"%>
<%@ Import Namespace="SchoolIntercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Events
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Events</h2>
    <table>
        <tr>
            <td>
 <%  Html.Telerik().Grid<Event>()
        .Name("Events")
        .DataKeys(keys => keys.Add(s => s.EventsId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(GridButtonType.ImageAndText).Text("Add New Event"))
        .Columns(columns =>
        {
           // columns.Bound(m => m.EventsId).Title("Events");
            columns.Bound(m => m.Title);
            columns.Bound(m => m.Body);
            columns.Bound(m => m.StartDate);
            columns.Bound(m => m.EndDate);
            columns.Bound(m => m.AllDay)
            .ClientTemplate("<# if (PictureId == 0) { #> No Picture <# } else { #> <img alt='<#= PictureId #>' src='"
                     + Url.Content("<#= PicUrl #>")
                     + "' width='50px' height='50px'/> <# } #>")
                 .Title("Picture");
            columns.Command(commands =>
            {
                 commands.Edit().ButtonType(GridButtonType.ImageAndText).Text("Update Event");
                 commands.Delete().ButtonType(GridButtonType.ImageAndText).Text("Remove Event");
            }).Title("");
        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListEvent", "Events")
                       .Insert("_InsertEvent", "Events")
                       .Update("_UpdateEvent", "Events")
                       .Delete("_DeleteEvent", "Events"); 
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
