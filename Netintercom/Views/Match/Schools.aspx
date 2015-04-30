<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Schoolsc>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Schools
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Schools</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Schoolsc>()
        .Name("School")
        .DataKeys(keys => keys.Add(s => s.SchoolId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Schools"))
        .Columns(columns =>
        {
        
            columns.Bound(m => m.SchoolName);
            columns.Bound(m => m.Schoolabbreviation);
            columns.Bound(m => m.PictureId);
            columns.Bound(m => m.PicUrl)
                .ClientTemplate("<# if (PictureId == 0) { #> No Picture <# } else { #> <img alt='<#= PictureId #>' src='"
                    + Url.Content("<#= PicUrl #>")
                    + "' width='50px' height='50px'/> <# } #>")
                .Title("Picture");
            
                            columns.Command(commands =>
                            {
                                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Schools");
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Schools");
                            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListSchools", "Match")
                       .Insert("_InsertSchools", "Match")
                       .Update("_UpdateSchools", "Match")
                       .Delete("_DeleteSchools", "Match"); 
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
