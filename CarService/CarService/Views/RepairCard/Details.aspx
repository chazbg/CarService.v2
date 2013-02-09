<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<CarService.DAL.RepairCard>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>RepairCard</legend>

    <div class="display-field">
        <strong>Entry Date:</strong> <%: Html.DisplayFor(model => model.EntryDate) %>
    </div>

    <div class="display-field">
        <strong>Repair Finish Date:</strong> <%: Html.DisplayFor(model => model.RepairFinishDate) %>
    </div>

    <div class="display-field">
        <strong>Employee:</strong> <%: Html.DisplayFor(model => model.Employee.FirstName) %>
    </div>

    <div class="display-field">
        <strong>Car Registry Number:</strong> <%: Html.DisplayFor(model => model.Car.RegistryNumber) %>
    </div>

    <div class="display-field">
        <strong>Description:</strong> <%: Html.DisplayFor(model => model.Description) %>
    </div>

    <div class="display-field">
        <strong>Parts Price:</strong> <%: Html.DisplayFor(model => model.PartsPrice) %>
    </div>

    <div class="display-field">
        <strong>Total Repair Cost:</strong> <%: Html.DisplayFor(model => model.TotalPrice) %>
    </div>

    <div class="display-field">
        <strong>Created By:</strong> <%: Html.DisplayFor(model => model.UserProfile.UserName) %>
    </div>
 
<h3>Parts used for the selected repair</h3> 
<table class="sortable" id="pagedTable"> 
    <tr> 
        <th>Part No.</th> 
        <th>Part</th> 
        <th>Price</th>  
    </tr> 
 
    <% foreach (var item in Model.SpareParts) 
    { %>
    <tr> 
        <td> 
            <%: item.Id  %>
        </td>
        <td> 
            <%: item.PartName  %>
        </td> 
        <td> 
            <%: item.Price %>
        </td> 
    </tr> 
   <% } %>  
</table> 
<div id="pageNavPosition"></div>
</fieldset>
<p>
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

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
