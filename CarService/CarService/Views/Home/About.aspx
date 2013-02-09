<%@ Page Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About - FMI Autos
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>About FMI Autos</h1>
    </hgroup>

    <article>
        <p>
            This is an ASP.NET Project for my course.
            The site presents a car service which has users who can fill in the documentation about a car repair and add cars.
            Administrators can also add new users, repair parts and service workers. 
        </p>
    </article>

    <aside>
        <h3>Author</h3>
        <p>
            Dian Nikolov /dian.nikolov91@gmail.com/
        </p>
        <ul>
            <li><%: Html.ActionLink("Home", "Index", "Home") %></li>
            <li><%: Html.ActionLink("About", "About", "Home") %></li>
        </ul>
    </aside>
</asp:Content>