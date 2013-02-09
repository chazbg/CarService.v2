<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CarService.DAL.UserProfile>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <a href="../Account/Register">Create new</a>
</p>

<table class="sortable" id="pagedTable">
    <tr>
        <th>
            Id 
        </th>
        <th>
            User Name 
        </th>
        <th>
            First Name 
        </th>
        <th>
            Last Name 
        </th>
        <th>
            E-Mail 
        </th>
        <th>
            Activated 
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserId) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.FirstName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.LastName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Email) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Activated) %>
        </td>
        <td>
            <%if (item.Activated) %><%: Html.ActionLink("Edit", "Edit", new { id=item.UserId }) %> 
            | <%: Html.ActionLink("Delete", "Delete", new { id=item.UserId }) %>
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
