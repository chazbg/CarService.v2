<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<CarService.DAL.Car>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>Car</legend>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.RegistryNumber) %>:</strong> <%: Html.DisplayFor(model => model.RegistryNumber) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Brand) %>:</strong> <%: Html.DisplayFor(model => model.Brand) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Model) %>:</strong> <%: Html.DisplayFor(model => model.Model) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Year) %>:</strong> <%: Html.DisplayFor(model => model.Year) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.FrameNumber) %>:</strong> <%: Html.DisplayFor(model => model.FrameNumber) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.EngineNumber) %>:</strong> <%: Html.DisplayFor(model => model.EngineNumber) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Color) %>:</strong> <%: Html.DisplayFor(model => model.Color) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.EngineWorkVolume) %>:</strong> <%: Html.DisplayFor(model => model.EngineWorkVolume) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Description) %>:</strong> <%: Html.DisplayFor(model => model.Description) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.Owner) %>:</strong> <%: Html.DisplayFor(model => model.Owner) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.PhoneNumber) %>:</strong> <%: Html.DisplayFor(model => model.PhoneNumber) %>
    </div>

    <div class="display-label">
        <strong><%: Html.DisplayNameFor(model => model.UserId) %>:</strong> <%: Html.DisplayFor(model => model.UserProfile.UserName) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
