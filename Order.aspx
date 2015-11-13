<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Shopping_Order" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <link href='<%= ResolveUrl("~/Styles/Order.css") %>' rel="stylesheet" />
</asp:Content>

<asp:Content ID="formContent" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <label>Please select a product:</label>
    <asp:DropDownList ID="ddlProducts" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="Name" DataValueField="ProductID" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HatLoversStoreConnectionString %>"
         SelectCommand="SELECT [ProductID], [Name], [Color], [Material], [LongDescription], [ImageFile], [UnitPrice] FROM [Products] ORDER BY [Name]">
    </asp:SqlDataSource>
    <div id="productData">   
        <asp:Label ID="lblName" runat="server" Text="Label" ForeColor="#003399"></asp:Label><br />
        <strong><label>Color: </label></strong><asp:Label ID="lblColor" runat="server" Text="Label"></asp:Label><br />
        <strong><label>Material: </label></strong><asp:Label ID="lblMaterial" runat="server" Text="Label"></asp:Label><br /><br />
        <strong><label>Details: </label></strong><asp:Label ID="lblLongDescription" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="lblUnitPrice" runat="server" Text="Label" ForeColor="#003399"></asp:Label><br />
        <label id="lblQuantity">Quantity</label>
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ErrorMessage="Quantity is required" ControlToValidate="txtQuantity" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rgvQuantity" runat="server" ErrorMessage="Must be between 1 and 500" ControlToValidate="txtQuantity" CssClass="validator" Display="Dynamic" MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add to Cart" CssClass="button" />
        <asp:Button ID="btnCart" runat="server" CausesValidation="False" PostBackUrl="~/Shopping/Cart" Text="Go to Cart" CssClass="button" /><br /><br />
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx">Go to Favorites</asp:HyperLink>
    </div>
    <asp:Image ID="imgProduct" runat="server" />
</asp:Content> 



