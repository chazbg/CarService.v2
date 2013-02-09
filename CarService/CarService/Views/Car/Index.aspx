<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CarService.DAL.Car>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table class="sortable" id="pagedTable">
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.RegistryNumber) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.FrameNumber) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Color) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Owner) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.PhoneNumber) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.UserProfile.UserName) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.RegistryNumber) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.FrameNumber) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Color) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Owner) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PhoneNumber) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserProfile.UserName) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> | 
            <%: Html.ActionLink("Details", "Details", new { id=item.Id }) %> 
        </td>
    </tr>
<% } %>

</table>
<div id="pageNavPosition"></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript">
        var pager = new Pager('pagedTable', 15);
        pager.init();
        pager.showPageNav('pager', 'pageNavPosition');
        pager.showPage(1);
</script>
</asp:Content>
