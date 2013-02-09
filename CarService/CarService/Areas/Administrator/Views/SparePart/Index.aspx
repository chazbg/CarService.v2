<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CarService.DAL.SparePart>>" %>

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
            <%: Html.DisplayNameFor(model => model.PartName) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Price) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Activated) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.UserProfile.UserName) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.PartName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Price) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Activated) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserProfile.UserName) %>
        </td>
        <td>
            <%if (item.Activated) %><%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> 
            | <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
        </td>
    </tr>
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
