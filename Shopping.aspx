<%@ Page Title="Hat Lovers Store" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Shopping.aspx.cs" Inherits="Shopping" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href="Styles/Master.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <h1>Shopping</h1>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Home">Favorite Products</asp:HyperLink><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Shopping/Order">Order a Product</asp:HyperLink><br />
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Shopping/Cart">Go to Cart</asp:HyperLink><br />
    <br />
     
</asp:Content>