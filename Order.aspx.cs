using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Shopping_Order : System.Web.UI.Page
{
    private Product selectedProduct;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            //bind drop-down list to product data from database
            ddlProducts.DataBind();

            //get the 'productID' URL parameter from the page's RouteData object
            string routeProductID = RouteData.Values["productID"].ToString();

            //if no parameter value, add product ID to URL and reload page
            if (routeProductID == "")
                AddProductIdToUrlAndRedirect();
            else //URL has product ID - use it to set drop-down value
                this.ddlProducts.SelectedValue = routeProductID;

            //Display information about the selected product in the form
            ShowSelectedProduct();
        }
    }

    protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e) {
        AddProductIdToUrlAndRedirect();
    }

    private void AddProductIdToUrlAndRedirect() {
        //add selected product to the friendly URL and re-load page
        Response.Redirect("~/Shopping/Order/" + ddlProducts.SelectedValue);
    }

    private void ShowSelectedProduct() {
        selectedProduct = this.GetSelectedProduct();
        lblName.Text = selectedProduct.Name;
        lblColor.Text = selectedProduct.Color;
        lblMaterial.Text = selectedProduct.Material;
        lblLongDescription.Text = selectedProduct.LongDescription;
        lblUnitPrice.Text = selectedProduct.UnitPrice.ToString("c") + " each";
        imgProduct.ImageUrl = "Images/Products/" + selectedProduct.ImageFile;
    }

    private Product GetSelectedProduct() {
        //get row from SqlDataSource based on value in dropdownlist
        DataView productsTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        productsTable.RowFilter = string.Format("ProductID = '{0}'",
            ddlProducts.SelectedValue);
        DataRowView row = (DataRowView)productsTable[0];

        //create a new product object and load with data from row
        Product p = new Product();
        p.ProductID = row["ProductID"].ToString();
        p.Name = row["Name"].ToString();
        p.Color = row["Color"].ToString();
        p.Material = row["Material"].ToString();
        p.LongDescription = row["LongDescription"].ToString();
        p.UnitPrice = (decimal)row["UnitPrice"];
        p.ImageFile = row["ImageFile"].ToString();
        return p;
    }

    protected void btnAdd_Click(object sender, EventArgs e) {
        if (Page.IsValid) {
            //get cart from session and selected item from cart
            CartItemList cart = CartItemList.GetCart();
            selectedProduct = GetSelectedProduct();
            CartItem cartItem = cart[selectedProduct.ProductID];

            //if item isn’t in cart, add it; otherwise, increase its quantity
            if (cartItem == null) {
                cart.AddItem(selectedProduct,
                             Convert.ToInt32(txtQuantity.Text));
            }
            else {
                cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
            }
            Response.Redirect("~/Shopping/Cart");
        }
    }
}