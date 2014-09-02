<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Settings>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Services
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Client Settings</h2>

    <table>
        <tr>
            <td>
             <% Html.Telerik().Grid<Settings>()
                    .Name("Settings")
                    .DataKeys(keys => keys.Add(s => s.SettingId))
                    .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Setting"))
                    .Columns(columns =>
                    {
                        columns.Bound(m => m.SettingId);
                        columns.Bound(m => m.Setting);
                        columns.Bound(m => m.Value);
                        columns.Bound(m => m.ClientName);
                        columns.Bound(m => m.ClientId);
                        columns.Command(commands =>
                        {
                            commands.Edit().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Update Setting");
                            commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Setting");
                        });
                    })
                    .DataBinding(dataBinding => 
                    {
                        dataBinding.Ajax()
                                   .Select("_ListSettings", "Settings")
                                   .Update("_UpdateSetting","Settings")
                                   .Insert("_InsertSetting", "Settings")
                                   .Delete("_DeleteSetting", "Settings"); 
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
