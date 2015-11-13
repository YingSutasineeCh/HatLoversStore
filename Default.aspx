<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Home.css") %>' rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="formPlaceholder" Runat="Server">
    <h1>Our Most Popular Products</h1>
    <div class="product">
        <asp:Image runat="server" ImageUrl="~/Images/Products/bt2.jpg" AlternateText="Classic Sunshade Hat" /><br />
        <asp:HyperLink runat="server"  NavigateUrl="~/Shopping/Order/BT002" ForeColor="#3333CC">Classic Sunshade Hat</asp:HyperLink>
    </div>
    <div class="product">
        <asp:Image runat="server" ImageUrl="~/Images/Products/sc1.jpg" AlternateText="Lions Bones Cap" /><br />
        <asp:HyperLink runat="server"  NavigateUrl="~/Shopping/Order/SC001" ForeColor="#3333CC">Lions Bones Cap</asp:HyperLink>
    </div>
    <div class="product">
        <asp:Image runat="server" ImageUrl="~/Images/Products/vs4.jpg" AlternateText="Badu Visor" /><br />
        <asp:HyperLink runat="server" NavigateUrl ="~/Shopping/Order/VS004" ForeColor="#3333CC">Badu Visor</asp:HyperLink>
    </div>
    <br /><br />
    <div id="goto">
        <asp:HyperLink runat="server" NavigateUrl="~/Shopping/Order" ForeColor="#3333CC">Go to Order page</asp:HyperLink>
    </div>
    
</asp:Content>

