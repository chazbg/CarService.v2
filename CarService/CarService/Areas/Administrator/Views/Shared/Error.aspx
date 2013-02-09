<%@ Page Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error - My ASP.NET MVC Application
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1 class="error">Error.</h1>
        <h2 class="error">An error occurred while processing your request.</h2>
    </hgroup>
</asp:Content>
