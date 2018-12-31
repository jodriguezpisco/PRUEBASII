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
    public partial class productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdProducto"] = "0";
            }
            CargarGrillaProductos();
        }

        protected void btnnuevopro_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarproducto.Visible = true;
                btnnuevopro.Visible = false;
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
                pnlagregarproducto.Visible = false;
                btnnuevopro.Visible = true;
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
                if (txbnombre.Value != "" || txbdesc.Value != "" || txbval.Value != "")
                {
                    entProductos obj = new entProductos();
                    obj.Operacion = 1;
                    obj.id = Convert.ToInt32(Session["IdProducto"]);
                    obj.nombre = txbnombre.Value;
                    obj.descripcion = txbdesc.Value;
                    obj.valor = txbval.Value;
                    if (negProductos.AgregarProductos(obj) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Guardado()", true);
                        LimpiarCampos();
                        pnlagregarproducto.Visible = false;
                        btnnuevopro.Visible = true;
                        CargarGrillaProductos();
                        Session["IdProducto"] = "0";
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
            txbdesc.Value = "";
            txbval.Value = "";
        }

        protected void CargarGrillaProductos()
        {
            try
            {
                grvproductos.DataSource = negProductos.ListarProductos();
                grvproductos.DataBind();
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
                TableCell grvproductose = (TableCell)btneditar.Parent;
                GridViewRow row = (GridViewRow)grvproductose.Parent;
                grvproductos.SelectedIndex = row.RowIndex;
                int fila = row.RowIndex;
                int idpro = int.Parse(grvproductos.Rows[fila].Cells[0].Text);
                Session["IdProducto"] = idpro;
                int operacion = 2;
                entProductos obj = negProductos.ListarProductosEditar(operacion, idpro);
                txbnombre.Value = obj.nombre;
                txbdesc.Value = obj.descripcion;
                txbval.Value = obj.valor;
                pnlagregarproducto.Visible = true;
                btnnuevopro.Visible = false;
            }
            catch (Exception EX)
            {

                throw EX;
            }
        }

        protected void grvproductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvproductos.PageIndex = e.NewPageIndex;
                grvproductos.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}