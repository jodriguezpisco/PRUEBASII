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
    public partial class ventas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Idventa"] = "0";
                CargarCombos();
            }
            CargarGrillaVentasCompanias();
        }

        protected void btnnuevavta_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarventacom.Visible = true;
                btnnuevavta.Visible = false;
                btnvtsxcom.Visible = false;
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
                pnlagregarventacom.Visible = false;
                btnnuevavta.Visible = true;
                cmbcom.ClearSelection();
                cmbpro.ClearSelection();
                btnvtsxcom.Visible = true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CargarCombos()
        {
            try
            {
                //cargar el combo de compañias
                cmbcom.Items.Add(new ListItem("--Seleccione Compañia--", "0"));
                List<entCompanias> com = negCompanias.ListarCompanias();
                foreach (entCompanias objcom in com)
                {
                    ListItem item = new ListItem(objcom.nombre, objcom.id.ToString());
                    cmbcom.Items.Add(item);
                }

                //cargar el combo de productos
                cmbpro.Items.Add(new ListItem("--Seleccione Producto--", "0"));
                List<entProductos> pro = negProductos.ListarProductos();
                foreach (entProductos objpro in pro)
                {
                    ListItem item = new ListItem(objpro.nombre, objpro.id.ToString());
                    cmbpro.Items.Add(item);
                }

                //cargar el combo de compañias para consulta de ventas
                cmbcomvtas.Items.Add(new ListItem("--Seleccione Compañia--", "0"));
                List<entCompanias> comvta = negCompanias.ListarCompanias();
                foreach (entCompanias objcom in comvta)
                {
                    ListItem item = new ListItem(objcom.nombre, objcom.id.ToString());
                    cmbcomvtas.Items.Add(item);
                }


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
                if (cmbcom.SelectedValue != "0" || cmbpro.SelectedValue != "0")
                {
                    entVentas obj = new entVentas();
                    obj.Operacion = 1;
                    obj.id = Convert.ToInt32(Session["Idventa"]);
                    obj.id_compania = Convert.ToInt32(cmbcom.SelectedValue);
                    obj.id_producto = Convert.ToInt32(cmbpro.SelectedValue);
                    if (negVentas.AgregarVentasCompanias(obj) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Guardado()", true);
                        LimpiarCampos();
                        pnlagregarventacom.Visible = false;
                        btnnuevavta.Visible = true;
                        CargarGrillaVentasCompanias();
                        Session["Idventa"] = "0";
                        btnvtsxcom.Visible = true;
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
            try
            {
                cmbcom.ClearSelection();
                cmbpro.ClearSelection();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void CargarGrillaVentasCompanias()
        {
            try
            {
                grvventascom.DataSource = negVentas.ListarVentasCompanias();
                grvventascom.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void grvventascom_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvventascom.PageIndex = e.NewPageIndex;
                grvventascom.DataBind();
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
                btnvtsxcom.Visible = false;
                Button btneditar = (Button)sender;
                TableCell grvventascome = (TableCell)btneditar.Parent;
                GridViewRow row = (GridViewRow)grvventascome.Parent;
                grvventascom.SelectedIndex = row.RowIndex;
                int fila = row.RowIndex;
                int idvta = int.Parse(grvventascom.Rows[fila].Cells[0].Text);
                Session["Idventa"] = idvta;
                int operacion = 2;
                entVentas obj = negVentas.ListarVentasEditar(operacion, idvta);
                cmbcom.SelectedValue = Convert.ToInt32(obj.idcom).ToString();
                cmbpro.SelectedValue = Convert.ToInt32(obj.idpro).ToString();
                pnlagregarventacom.Visible = true;
                btnnuevavta.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnvtsxcom_Click(object sender, EventArgs e)
        {
            try
            {
                pnlvtsxcom.Visible = true;
                pnlgrvvtscom.Visible = false;
                btnnuevavta.Visible = false;
                btnvtsxcom.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btncancela_Click(object sender, EventArgs e)
        {
            try
            {
                pnlvtsxcom.Visible = false;
                pnlgrvvtscom.Visible = true;
                btnnuevavta.Visible = true;
                btnvtsxcom.Visible = true;
                cmbcomvtas.ClearSelection();
                grvvtsxcom.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void cmbcomvtas_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int idcom = Convert.ToInt32(cmbcomvtas.SelectedValue);
                grvvtsxcom.DataSource = negVentas.ListarVentasxCompanias(idcom);
                grvvtsxcom.DataBind();
            }
            catch (Exception EX)
            {

                throw EX;
            }
        }
    }
}