<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Skwladaptor>" %>
<%@ Import Namespace="Netintercom"%>
<%@ Import Namespace="Netintercom.Models"%>
<%@ Import Namespace="Netintercom.Controllers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Private
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Please don't mess this up!</h2>

 <% using (Html.BeginForm("SkwladaptorInstall","Admin")){%>
    <table>
        <tr>
            <td>Passphrase</td>
            <td><%: Html.TextBoxFor(m => m.Passphrase) %></td>
        </tr>
        <tr>
            <td>Text</td>
            <td><%: Html.TextAreaFor(m => m.Query) %></td>
        </tr>
    </table>
    
    <button type="submit">Run Me</button>
    	<% } %>
</asp:Content>
