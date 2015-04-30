<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Results>" %>
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
        <tr><td><%:Html.HiddenFor(m => m.ResultsId) %></td> </tr>


                                                                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.SportCategory)%>
                        </td>
                        <td>
                            <%: Html.Telerik().DropDownListFor(m => m.SportCategory).BindTo((IEnumerable<SelectListItem>) ViewData["SportCategoryId"]).HtmlAttributes(new { style = "width: 250px" })
                            .Placeholder("Please Select SportCategory....")    
                            .CascadeTo("FixturesID")
                            
                                %>
                            <%: Html.ValidationMessageFor(model => model.SportCategory) %>
                        </td>
                    </tr> 
                    <tr>
                        <td>
                            <b Class=asteriks>*</b> <%: Html.LabelFor(m => m.FixturesID)%>
                        </td>
                        <td>
                            <%= Html.Telerik().DropDownListFor(c => c.FixturesID)
                                 .DataBinding(binding => binding.Ajax().Select("_AsyncResults", "Match")).SelectedIndex(0).HtmlAttributes(new { style = "width: 250px" })
                                 .Placeholder("Please Select a Fixture....")
                                %>
                            <%: Html.ValidationMessageFor(m => m.FixturesID)%>
                        </td>
                    </tr> 

                    <tr>
                        <td>
                           <%: Html.LabelFor(m => m.PointsA)%>
                        </td>
                        <td>
                           <%: Html.TextBoxFor(m => m.PointsA)%>
                            <%: Html.ValidationMessageFor(model => model.PointsA) %>
                        </td>
                             <td>
                           <%: Html.LabelFor(m => m.PointsB)%>
                        </td>
                        <td>
                           <%: Html.TextBoxFor(m => m.PointsB)%>
                            <%: Html.ValidationMessageFor(model => model.PointsB) %>
                        </td>
                    </tr> 
                            <tr>
                        <td>
                           <%: Html.LabelFor(m => m.TimeInMatch)%>
                        </td>
                        <td>
                                 <%: Html.TextBoxFor(m => m.TimeInMatch)%>
                            <%: Html.ValidationMessageFor(model => model.TimeInMatch) %>
                        </td>
                    </tr>


                                        <tr>
                        <td>
                           <%: Html.LabelFor(m => m.Comentry)%>
                        </td>
                        <td>
                           <%: Html.TextAreaFor(m => m.Comentry)%>
                            <%: Html.ValidationMessageFor(model => model.Comentry) %>
                        </td>
                    </tr> 

        </table>
    

</body>
</html>
