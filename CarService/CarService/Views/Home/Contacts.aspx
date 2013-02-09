<%@ Page Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    FMI Autos
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>FMI Autos</h1>
                <%if (User.Identity.IsAuthenticated){%>
                  <h2>Hello, <%: User.Identity.Name %></h2>
               <% } %>
                
            </hgroup>
            <p>
                Welcome to the site control panel
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <% if (User.IsInRole("User")){%>
    <h3>Welcome to your control panel:</h3>
    <ul>
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
