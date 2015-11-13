<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Map" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadPlaceholder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Map.css") %>' rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <h1>Site Map</h1>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows" >
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD"></HoverNodeStyle>
        <NodeStyle HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" Font-Names="Verdana" 
            Font-Size="10pt" ForeColor="Black"></NodeStyle>
        <ParentNodeStyle Font-Bold="False"></ParentNodeStyle>        
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</asp:Content>

