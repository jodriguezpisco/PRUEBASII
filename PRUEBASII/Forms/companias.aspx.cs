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
    public partial class companias : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrillaCompanias();
        }

        protected void btnnuevacom_Click(object sender, EventArgs e)
        {
            try
            {
                LimpiarCampos();
                pnlagregarcompania.Visible = true;
                btnnuevacom.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarcompania.Visible = false;
                btnnuevacom.Visible = true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txbnombre.Value != "" || txbnit.Value != "" || txbdve.Value != "" || txbte1.Value != "" || txbdir.Value != "")
                {
                    entCompanias obj = new entCompanias();
                    obj.Operacion = 1;
                    obj.id = Convert.ToInt32(Session["IdCompania"]);
                    obj.nombre = txbnombre.Value;
                    obj.nit = txbnit.Value;
                    obj.dig_ver = txbdve.Value;
                    obj.telefono1 = txbte1.Value;
                    obj.telefono2 = txbte2.Value;
                    obj.direccion = txbdir.Value;
                    if(negCompanias.AgregarCompanias(obj) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Guardado()", true);
                        LimpiarCampos();
                        pnlagregarcompania.Visible = false;
                        btnnuevacom.Visible = true;
                        CargarGrillaCompanias();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sindatos()", true);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void LimpiarCampos()
        {
            txbnombre.Value = "";
            txbnit.Value = "";
            txbdve.Value = "";
            txbte1.Value = "";
            txbte2.Value = "";
            txbdir.Value = "";
        }

        protected void CargarGrillaCompanias()
        {
            try
            {
                grvcompanias.DataSource = negCompanias.ListarCompanias();
                grvcompanias.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void grvcompanias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvcompanias.PageIndex = e.NewPageIndex;
                grvcompanias.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            try
            {
                Button btneditar = (Button)sender;
                TableCell grvcompaniase = (TableCell)btneditar.Parent;
                GridViewRow row = (GridViewRow)grvcompaniase.Parent;
                grvcompanias.SelectedIndex = row.RowIndex;
                int fila = row.RowIndex;
                int idcom = int.Parse(grvcompanias.Rows[fila].Cells[0].Text);
                Session["IdCompania"] = idcom;
                int operacion = 2;
                entCompanias obj = negCompanias.ListarCompaniasEditar(operacion, idcom);
                txbnombre.Value = obj.nombre;
                txbnit.Value = obj.nit;
                txbdve.Value = obj.dig_ver;
                txbte1.Value = obj.telefono1;
                txbte2.Value = obj.telefono2;
                txbdir.Value = obj.direccion;
                pnlagregarcompania.Visible = true;
                btnnuevacom.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}