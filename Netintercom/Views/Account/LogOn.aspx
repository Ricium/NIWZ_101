<%@ Page Language="C#"  Inherits="System.Web.Mvc.ViewPage<Netintercom.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <script src="<%= Url.Content("~/Scripts/MicrosoftAjax.js")%>"  type="text/javascript"></script>
    <script src="<%= Url.Content("~/Scripts/MicrosoftMvcAjax.js")%>"  type="text/javascript"></script>
    <script src="<%= Url.Content("~/Scripts/MicrosoftMvcValidation.js")%>"  type="text/javascript"></script>

    
    <link rel="stylesheet" type="text/css" href="<%= Url.Content("~/Content/Site.css")%>" />
    <title>School Intercom</title>
</head>

<body>
<script src="<%= Url.Content("~/Scripts/jquery-1.7.1.min.js")%>"  type="text/javascript"></script>  

    <div id="logonpage">

   
<table width="400"><tr><td style="text-align:center;font-size:1.75em;color:red;"></td></tr>
<tr class="logonheader"><td height="55px"><b>PLEASE LOGIN BELOW</b></td></tr>
<tr><td>Please enter your username and password details into the respective textboxes, then click on the continue button to proceed.<br /><br />
    

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <table width="400"><tr>
                <td>
                    <%: Html.LabelFor(m => m.UserName) %>
                </td>
                <td>
                    <%: Html.TextBoxFor(m => m.UserName) %><br />
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </td>
                </tr>
                <tr>
                <td>
                    <%: Html.LabelFor(m => m.Password) %>
                </td>
                <td>
                    <%: Html.PasswordFor(m => m.Password) %><br />
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </td>
                </tr>
                <tr>
                <td><%: Html.ActionLink("Forgot Password","ResetPassword","Account") %></td>        
                <td>
                    <button type="submit"><img src="../images/Shared/ButtonIcons/signin.gif" />&nbsp Continue</button>
                </td>
                </tr>
            </table>
        </div>
    <% } %>

    </td></tr></table>

    </div>
</body>
</html>