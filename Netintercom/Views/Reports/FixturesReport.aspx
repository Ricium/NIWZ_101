<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<FixturesReport>"%>
<%@ Import Namespace="SparStelsel"%>
<%@ Import Namespace="SparStelsel.Models"%>
<%@ Import Namespace="SparStelsel.Controllers"%>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>FixturesReportPDF</title>
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
<fieldset>
    <legend>Fixture: <%:Model.ReportDate%></legend>
  <table>
      <tr>
          <td>Home Team</td>
          <td><%: Model.hometeam %></td>
          <td>"VS"</td>
          <td>Away Team</td>
          <td><%:Model.awayteam %></td>
      </tr>
  </table>

</fieldset>
  
  
</body>
</html>
