<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Home Page.</h1>
                <h2><%: ViewBag.Message %></h2>
            </hgroup>
            <p>
                To learn more about ASP.NET MVC visit
                <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET MVC.
                If you have any questions about ASP.NET MVC visit
                <a href="http://forums.asp.net/1146.aspx/1?MVC" title="ASP.NET MVC Forum">our forums</a>.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <% if (User.IsInRole("User")){%>
    <h3>Welcome to your control panel:</h3>
    <ul class="round">
        <li>
            <%: Html.ActionLink("Manage repair cards", "Index", "RepairCard", routeValues:  null, htmlAttributes: new { id = "repairCardLink" })%>
        </li>

        <li>
            <%: Html.ActionLink("Manage cars", "Index", "Car", routeValues: null, htmlAttributes: new { id = "carLink" })%>
        </li>
    </ul>
    <%} else {%>
    <h3>You need to log in to be able to access the features of this site</h3>
    <%}  %>
</asp:Content>
