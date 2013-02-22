<%@ Page Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    FMI Autos
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>FMI Autos</h1>
                <h2>Hello, <%: User.Identity.Name %></h2>
            </hgroup>
            <p>
                Welcome to the site control panel
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>You are now logged in as an administrator. You can do the following actions:</h3>
    <ul class="round">
        <li>
            <%: Html.ActionLink("Manage users", "Index", "UserProfile", routeValues: null, htmlAttributes: new { id = "registerLink" })%>
        </li>

        <li>
            <%: Html.ActionLink("Manage employees", "Index", "Employee", routeValues:  null, htmlAttributes: new { id = "employeeLink" })%>
        </li>

        <li>
            <%: Html.ActionLink("Manage spare parts", "Index", "SparePart", routeValues: null, htmlAttributes: new { id = "sparePartLink" })%>
        </li>

        <li>
            <a href="../RepairCard">Manage repair cards</a>
        </li>

         <li>
             <a href="../Car">Manage cars</a>
        </li>
         
    </ul>
</asp:Content>
