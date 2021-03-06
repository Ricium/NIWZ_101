﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Advertisement
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Advertisement</h2>

    <table>
        <tr>
            <td>
 <% Html.Telerik().Grid<Advertisement>()
        .Name("Advertisement")
        .DataKeys(keys => keys.Add(s => s.AdvertisementId))
        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Advertisement"))
        .Columns(columns =>
        {
            //columns.Bound(m => m.AdvertisementId).Title("Advertisement");
            columns.Bound(m => m.Title);
            columns.Bound(m => m.Body);
            columns.Bound(m => m.Email);
            columns.Bound(m => m.Number);
            columns.Bound(m => m.WebSiteUrl);
            columns.Bound(m => m.AdvertisementId)
             .ClientTemplate("<# if (PictureId == 0) { #> No Picture <# } else { #> <img alt='<#= PictureId #>' src='"
                     + Url.Content("<#= PicUrl #>")
                     + "' width='50px' height='50px'/> <# } #>")
                 .Title("Picture");
            columns.Command(commands =>
            {
                commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Advertisement");
                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Advertisement");

            }).Title("");
                        })
        .DataBinding(dataBinding => 
        {
            dataBinding.Ajax()
                       .Select("_ListAdvertisement", "ProAd")
                       .Insert("_InsertAdvertisement", "ProAd")
                       .Update("_UpdateAdvertisement", "ProAd")
                       .Delete("_DeleteAdvertisement", "ProAd"); 
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
