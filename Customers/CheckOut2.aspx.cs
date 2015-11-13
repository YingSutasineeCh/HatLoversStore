using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

public partial class Customers_CheckOut2 : System.Web.UI.Page
{
    CartItemList cart;
    string email;
    string invoiceNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (!Request.IsSecureConnection)
        {
            string url = "https:"
                + ConfigurationManager.AppSettings["SecureAppPath"]
                + "CheckOut2.aspx";
            Response.Redirect(url);
        }*/

        cart = (CartItemList) Session["Cart"];
        email = (string)Session["Email"];
        if (!IsPostBack)
            this.LoadYears();
    }

    private void LoadYears()
    {
        int year = DateTime.Now.Year;
        for (int i = 0; i < 7; i++)
        {
            ddlYear.Items.Add(year.ToString());
            year += 1;
        }
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            this.PutInvoice();
            this.GetInvoiceNumber();
            this.PutLineItems();
            Session.Remove("Cart");
            Response.Redirect("Confirmation.aspx");
        }
    }

    private void PutInvoice()
    {
        SqlDataSource1.InsertParameters["CustEMail"].DefaultValue = email;
        SqlDataSource1.InsertParameters["OrderDate"].DefaultValue = DateTime.Today.ToString();
        int quantity = this.Quantity();

        SqlDataSource1.InsertParameters["ShipMethod"].DefaultValue
            = rblShipping.SelectedValue;
        double shipping = 0;
        switch (rblShipping.SelectedValue)
        {
            case "UPS Ground":
                shipping = 3.95 + (quantity - 1) * 1.25;
                break;
            case "UPS Second Day":
                shipping = 7.95 + (quantity - 1) * 2.5;
                break;
            case "Federal Express Next Day":
                shipping = 19.95 + (quantity - 1) * 4.95;
                break;
        }
        SqlDataSource1.InsertParameters["Shipping"].DefaultValue
            = shipping.ToString();

        decimal subTotal = this.SubTotal();
        SqlDataSource1.InsertParameters["Subtotal"].DefaultValue = subTotal.ToString();
        decimal salesTax = subTotal * (decimal)0.075;
        SqlDataSource1.InsertParameters["SalesTax"].DefaultValue = salesTax.ToString();
        decimal total = subTotal + salesTax;
        SqlDataSource1.InsertParameters["Total"].DefaultValue = total.ToString();
        SqlDataSource1.InsertParameters["CreditCardType"].DefaultValue = lstCardType.SelectedValue;
        SqlDataSource1.InsertParameters["CardNumber"].DefaultValue = txtCardNumber.Text;
        SqlDataSource1.InsertParameters["ExpirationMonth"].DefaultValue = ddlMonth.SelectedValue;
        SqlDataSource1.InsertParameters["ExpirationYear"].DefaultValue = ddlYear.SelectedValue;
        SqlDataSource1.Insert();
    }

    private int Quantity()
    {
        int quantity = 0;
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            quantity += cartItem.Quantity;
        }
        return quantity;
    }

    private decimal SubTotal()
    {
        decimal subTotal = 0;
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            subTotal += cartItem.Quantity * cartItem.Product.UnitPrice;
        }
        return subTotal;
    }

    private void GetInvoiceNumber()
    {
        string conString = ConfigurationManager.ConnectionStrings[
            "HatLoversStoreConnectionString"].ConnectionString;
        SqlConnection conHalloween =
            new SqlConnection(conString);
        SqlCommand invoiceNoCommand = 
            new SqlCommand("Select Ident_Current('Invoices') From Invoices", conHalloween);
        conHalloween.Open();
        invoiceNumber = invoiceNoCommand.ExecuteScalar().ToString();
        conHalloween.Close();
    }

    private void PutLineItems()
    {
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            SqlDataSource2.InsertParameters["InvoiceNumber"].DefaultValue = invoiceNumber;
            SqlDataSource2.InsertParameters["ProductID"].DefaultValue = cartItem.Product.ProductID;
            SqlDataSource2.InsertParameters["UnitPrice"].DefaultValue = cartItem.Product.UnitPrice.ToString();
            SqlDataSource2.InsertParameters["Quantity"].DefaultValue = cartItem.Quantity.ToString();
            SqlDataSource2.Insert();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        /*string url = "http:"
            + ConfigurationManager.AppSettings["UnsecureAppPath"]
            + "Order.aspx";
        Response.Redirect(url*/
        Response.Redirect("~/Shopping/Order");
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        /*string url = "http:"
            + ConfigurationManager.AppSettings["UnsecureAppPath"]
            + "Order.aspx";
        Response.Redirect(url);*/
        Response.Redirect("~/Shopping/Order");
    }
}
