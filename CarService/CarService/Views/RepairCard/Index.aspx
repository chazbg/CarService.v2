<%@ Page Title="" Language="C#" MasterPageFile="~/Content/smooth_and_sleek/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<CarService.DAL.RepairCard>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>


<input type="button" onclick="toggleVisibility('queryBySubstring')" value="Search By Substring"/>
<br />
<%using (Html.BeginForm(null, null, FormMethod.Post, new { id = "queryBySubstring", style = "display:none" }))
  {  %>   
        <strong>Entry Date: </strong>
        <select name="entryDate">
                <% foreach (var date in ViewBag.EntryDates) {%>
                     <option><%: date %></option>
                <% } %>
        </select>
        <strong>Reg. Number / Frame Number: </strong>
        <%: Html.TextBox("SearchString", null, new {style = "font-size:14px" }) %>  <input type="submit" value="Search" /> 
<%}%>
<br />
<input type="button" onclick="toggleVisibility('queryByTimeInterval')" value="Search By Time Interval"/>
<%using (Html.BeginForm(null, null, FormMethod.Post, new { id = "queryByTimeInterval", style = "display:none" }))
  {  %>   
        <strong>Start:</strong> <select name="startDate">
            <% foreach (var date in ViewBag.EntryDates)
               {%>
                      <option><%: date%></option>
            <% } %>
        </select>
        <strong>End:</strong> <select name="endDate">
                <% foreach (var date in ViewBag.EntryDates)
                   {%>
                <option><%: date%></option>
                <% } %>
        </select>
        <input type="submit" value="Search" /> 
<%}%>

<table class="sortable" id="pagedTable">
    <tr>
        <th>
            Entry Date
        </th>
        <th>
            Repair Finish Date
        </th>

        <th>
            Car Frame Number
        </th>

        <th>
            Car Registry Number
        </th>

        <th>
            Total Cost
        </th>

        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.EntryDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.RepairFinishDate) %>
        </td>

        <td>
            <%: Html.DisplayFor(modelItem => item.Car.FrameNumber) %>
        </td>

        <td>
            <%: Html.DisplayFor(modelItem => item.Car.RegistryNumber) %>
        </td>

        <td>
            <%: Html.DisplayFor(modelItem => item.TotalPrice) %>
        </td>

        <td>
            <%: Html.ActionLink("Details", "Details", new { id=item.Id }) %> 
            <% if (!(!(item.RepairFinishDate == null) || !(item.UserId == ViewBag.CurrentUserId || ViewBag.IsAdmin))) { %>
               | <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("Finish Repair", "RepairFinish", new { id=item.Id }) %>
            <% } %>
        </td>
    </tr>
<% } %> 
</table>
<table>
    <% if (null != ViewBag.TotalIncome) { %>
     <tr>
        <td>
            Total Income: 
        </td>
        <td>
            <%: ViewBag.TotalIncome %>
        </td>
        
    </tr>
    <%} %>
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
