<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Documents>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Documents
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Documents</h2>
    
    <table>
        <tr>
            <td>
                <%  Html.Telerik().Grid<Documents>()
                        .Name("Documents")
                        .DataKeys(keys => keys.Add(s => s.DocId))
                        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Add New Document"))
                        .Columns(columns =>
                        {
                                    //columns.Bound(m => m.ContactId).Title("Contact");
                                    columns.Bound(m => m.DocumentName);
      
                            columns.Command(commands =>
                            {
                                commands.Delete().ButtonType(Telerik.Web.Mvc.UI.GridButtonType.ImageAndText).Text("Remove Document");
                            }).Title("");
                        })
                        .DataBinding(dataBinding => 
                        {
                            dataBinding.Ajax()
                                       .Select("_ListDocuments", "Document")
                                       .Insert("_InsertDocument", "Document")
                                       .Delete("_DeleteDocument", "Document"); 
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
