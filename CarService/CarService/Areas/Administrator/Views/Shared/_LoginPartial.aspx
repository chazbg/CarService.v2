<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% if (Request.IsAuthenticated) { %>
    <ul>
    <li><%: Html.ActionLink("Account", "Manage", "../Account", routeValues: null, htmlAttributes: new { @class = "username", title = "Manage" }) %></li>
    <li><% using (Html.BeginForm("LogOff", "../Account", FormMethod.Post, new { id = "logoutForm" })) { %>
        <%: Html.AntiForgeryToken() %>
        <a href="javascript:document.getElementById('logoutForm').submit()">Log off</a>
    <% } %></li>

    </ul>
<% } else { %>
    <ul>
        <li><%: Html.ActionLink("Log in", "Login", "Account", routeValues: null, htmlAttributes: new { id = "loginLink" })%></li>
    </ul>
<% } %>