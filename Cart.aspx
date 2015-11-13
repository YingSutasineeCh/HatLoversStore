<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Cart.css") %>' rel="stylesheet" />
</asp:Content>
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <h1 id="title">Your shopping cart</h1>
    <asp:ListBox ID="lstCart" runat="server"></asp:ListBox>
    <div id="cartbuttons">               
        <asp:Button ID="btnRemove" runat="server" CssClass="button" Text="Remove Item" OnClick="btnRemove_Click" />
        <br />
        <asp:Button ID="btnEmpty" runat="server" CssClass="button" Text="Empty Cart" OnClick="btnEmpty_Click" />               
    </div>
    <div id="shopbuttons">              
        <asp:Button ID="btnContinue" runat="server" CssClass="button"  Text="Continue Shopping" OnClick="btnContinue_Click" />
        <asp:Button ID="btnCheckOut" runat="server" CssClass="button" Text="Check Out" OnClick="btnCheckOut_Click" PostBackUrl="~/Customers/CheckOut1.aspx" /><br /><br />
    </div>
    <p id="message">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" 
                    CssClass="button"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HatLoversStoreConnectionString %>"
         SelectCommand="SELECT [ProductID], [Name], [Color], [Material], [LongDescription], [ImageFile], [UnitPrice] FROM [Products] ORDER BY [Name]">
    </asp:SqlDataSource>      
</asp:Content>