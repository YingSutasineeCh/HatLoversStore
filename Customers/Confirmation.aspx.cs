using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customers_Confirmation : System.Web.UI.Page
{
   protected void btnReturn_Click(object sender, EventArgs e)
    {
        /*string url = "http:"
            + ConfigurationManager.AppSettings["UnsecureAppPath"]
            + "Order.aspx";*/
        Response.Redirect("~/Shopping/Order");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblConfirm.Text = "Thank you for your order. It will be shipped on " +
            DateTime.Today.AddDays(1).ToShortDateString() + ".";
    }
}