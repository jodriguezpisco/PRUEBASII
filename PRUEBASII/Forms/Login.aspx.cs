using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocios;

namespace PRUEBASII.Forms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_ServerClick(object sender, EventArgs e)
        {
            try
            {
                entUsuario obj = negUsuario.Login(txbuser.Value, txbcontra.Value);
                if (txbuser.Value != "" && txbcontra.Value != "")
                {
                    Session["usuario"] = obj;
                    if (obj != null)
                    {
                        Response.Redirect("/Forms/ppal.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "login();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "loginvacio();", true);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}