<%@ Page Title="Confirmation" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Customers_Confirmation" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Master.css") %>' rel="stylesheet" />
</asp:Content>
<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <p>
        <asp:Label ID="lblConfirm" runat="server"></asp:Label><br /><br />
    </p>
    <p>
        <asp:Button ID="btnReturn" runat="server" Text="Return to Order Page" OnClick="btnReturn_Click" CssClass="button" />
    </p>
</asp:Content>