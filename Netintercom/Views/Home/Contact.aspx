<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Contact>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Contact
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Contacts</h2>
    
    <table>
        <tr>
            <td>
                <%  Html.Telerik().Grid<Contact>()
                        .Name("Contact")
                        .DataKeys(keys => keys.Add(s => s.ContactId))
                        .ToolBar(commands => commands.Insert().ImageHtmlAttributes(new { style = "margin-left:0" }).ButtonType(GridButtonType.ImageAndText).Text("Add New Contact Detail"))
                        .Columns(columns =>
                        {
                                    //columns.Bound(m => m.ContactId).Title("Contact");
                                    columns.Bound(m => m.Name);
                                    columns.Bound(m => m.Surname);
                                    columns.Bound(m => m.Number);
                                    columns.Bound(m => m.Email);
                                    columns.Bound(m => m.Body);
      
                            columns.Command(commands =>
                            {
                                commands.Edit().ButtonType(GridButtonType.ImageAndText).Text("Update Contact");
                                commands.Delete().ButtonType(GridButtonType.ImageAndText).Text("Remove Contact");

                            }).Title("");
                        })
                        .DataBinding(dataBinding => 
                        {
                            dataBinding.Ajax()
                                       .Select("_ListContact", "Home")
                                       .Insert("_InsertContact", "Home")
                                       .Update("_UpdateContact", "Home")
                                       .Delete("_DeleteContact", "Home"); 
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
