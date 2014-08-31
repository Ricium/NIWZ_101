<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<News>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    News
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>News</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<News>()
        .Name("News")
        .DataKeys(keys => keys.Add(s => s.NewsId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New News"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.NewsId).Title("News");
            columns.Bound(m => m.Title);
            columns.Bound(m => m.Body);
            columns.Bound(m => m.PostDate).Format("{0:yyyy-MM-dd}");
            columns.Bound(c => c.PictureId)
                 .ClientTemplate("<# if (PictureId == 0) { #> No Picture <# } else { #> <img alt='<#= PictureId #>' src='"
                     + Url.Content("<#= PicUrl #>")
                     + "' width='50px' height='50px'/> <# } #>")
                 .Title("Picture");
                            columns.Command(commands =>
                            {   
                                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update News");
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove News");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListNews", "News")
                       .Insert("_InsertNews", "News")
                       .Update("_UpdateNews", "News")
                       .Delete("_DeleteNews", "News"); 
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
