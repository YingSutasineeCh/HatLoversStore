<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
    }

    public static void RegisterRoutes(RouteCollection routes)
    {
        // ignore WebResource.axd file
        routes.Ignore("{resource}.axd/{pathInfo}");

        //map static pages
        routes.MapPageRoute("Home", "Home", "~/Default.aspx");

        routes.MapPageRoute("Shopping", "Shopping", "~/Shopping.aspx");
        routes.MapPageRoute("Order", "Shopping/Order/{productID}", "~/Order.aspx",
                            false, new RouteValueDictionary { { "productID", "" } });

        routes.MapPageRoute("Cart", "Shopping/Cart", "~/Cart.aspx");
        //routes.MapPageRoute("Checkout", "Shopping/Checkout", "~/Customers/Checkout1.aspx");

        routes.MapPageRoute("Admin", "Admin/Administration", "~/Admin/Administration.aspx");
        routes.MapPageRoute("MaintenanceCatagory", "Admin/MaintenanceCatagory", "~/Admin/MaintenanceCatagory.aspx");
        routes.MapPageRoute("MaintenanceProduct", "Admin/MaintenanceProduct", "~/Admin/MaintenanceProduct.aspx");

        routes.MapPageRoute("Map", "Map", "~/Map.aspx");

    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
        /*ErrorHandler handler = new ErrorHandler();
        string result = handler.SendEmail();
        Response.Redirect("ErrorPage.aspx?email =" + result);*/

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
