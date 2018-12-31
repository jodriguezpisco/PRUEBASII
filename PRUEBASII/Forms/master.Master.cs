using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;

namespace PRUEBASII
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entUsuario obj = (entUsuario)Session["usuario"];
            lblnombre.Text = obj.nombre;
        }

        protected void ibtsalida_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Session.Remove("usuario");
                Response.Redirect("/Forms/login.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void aclientes_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/clientes.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void acompanias_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/companias.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void aproductos_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/productos.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void aventasCom_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/ventasCom.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void aventasCli_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/ventasCli.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void ainicio_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Forms/ppal.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}