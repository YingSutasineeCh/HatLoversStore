using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

public class ErrorHandler
{
    private Exception ex;
	public ErrorHandler()
	{
        Exception e = HttpContext.Current.Server.GetLastError();
        if (e.InnerException == null) ex = e;
        else ex = e.InnerException;
	}
    public string SendEmail()
    {
        string body = "An Exception occurred Attachment "
            + DateTime.Now.ToLongTimeString()
            + " on " + DateTime.Now.ToLongTimeString()
            + "<br/> Error Message: " + ex.Message;
        MailMessage msg = new MailMessage(
            "suyusky@gmail.com", "schoochi@montgomerycollege.edu");
        msg.Subject = "Exception in HatLovers application";
        msg.Body = body;
        msg.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("localhost");
        try
        {
            client.Send(msg);
            return "sent";
        }
        catch
        {
            return "notsent";
        }

    }
}