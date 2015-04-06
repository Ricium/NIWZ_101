<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Fixtures>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Contact</title>
</head>
<body>
    <%: Html.ValidationSummary(false) %>
    <table>
        <tr><td><%: Html.HiddenFor(m => m.FixturesId) %></td></tr>
               
                                                                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.SportCategoryId)%>
                        </td>
                        <td>
                            <%: Html.Telerik().DropDownListFor(m => m.SportCategoryId).BindTo((IEnumerable<SelectListItem>) ViewData["SportCategoryId"]).HtmlAttributes(new { style = "width: 250px" })
                            .Placeholder("Please Select SportCategory....")    
                            .CascadeTo("FieldId")
                            
                                %>
                            <%: Html.ValidationMessageFor(model => model.SportCategoryId) %>
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.FieldId)%>
                        </td>
                        <td>
                            <%= Html.Telerik().DropDownListFor(c => c.FieldId)
                                 .DataBinding(binding => binding.Ajax().Select("_AsyncFields", "Match")).SelectedIndex(0).HtmlAttributes(new { style = "width: 250px" })
                                 .Placeholder("Please Select a Field....")
                                 .CascadeTo("TeamIdA")%>
                            <%: Html.ValidationMessageFor(m => m.FieldId)%>
                        </td>
                    </tr>     

                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.TeamIdA)%>
                        </td>
                        <td>
                            <%= Html.Telerik().DropDownListFor(c => c.TeamIdA)
                                 .DataBinding(binding => binding.Ajax().Select("_AsyncTeams", "Match")).SelectedIndex(0).HtmlAttributes(new { style = "width: 250px" })
                                 .Placeholder("Please select Home Team ....")
                                 .CascadeTo("TeamIdB")%>
                            <%: Html.ValidationMessageFor(m => m.TeamIdA)%>
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.TeamIdB)%>
                        </td>
                        <td>
                            <%= Html.Telerik().DropDownListFor(c => c.TeamIdB)
                                 .DataBinding(binding => binding.Ajax().Select("_AsyncTeamsB", "Match")).SelectedIndex(0).HtmlAttributes(new { style = "width: 250px" })
                                 .Placeholder("Please select Away Team ....")
                                 %>
                            <%: Html.ValidationMessageFor(m => m.TeamIdB)%>
                        </td>
                    </tr> 


                                        <tr>
                        <td>
                           <%: Html.LabelFor(m => m.StartTime)%>
                        </td>
                        <td>
                           <%: Html.Telerik().DateTimePickerFor(m => m.StartTime)%>
                            <%: Html.ValidationMessageFor(model => model.StartTime) %>
                        </td>
                    </tr> 

        </table>
    

</body>
</html>
