<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CarService.DAL.Employee>>" %>

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
            <%: Html.DisplayNameFor(model => model.FirstName) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.LastName) %>
        </th>

        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <% if (item.FirstName != "N/A") %>
    <% {  %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.FirstName) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.LastName) %>
            </td>

            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
            </td>
        </tr>
    <% } %>
<% } %>

</table>
<div id="pageNavPosition"></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript"><!--
    var pager = new Pager('pagedTable', 15);
    pager.init();
    pager.showPageNav('pager', 'pageNavPosition');
    pager.showPage(1);
    //--></script>
</asp:Content>
